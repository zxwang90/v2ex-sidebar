/**
 * 监听消息
 */
chrome.runtime.onMessage.addListener(function(msg, sender, resp) {
    if (msg.type == 'login') {
        if (msg.remember) {
            chrome.storage.local.set({
                username: msg.username,
                password: msg.password,
                remember: msg.remember
            });
        }
        else {
            chrome.storage.local.set({
                username: '',
                password: '',
                remember: msg.remember
            });
        }
        login(msg.username, msg.password, function (e) {
            resp(e);
        });
    }
    else if (msg.type == 'auto-login') {
        chrome.storage.local.get({
            username: '',
            password: ''
        }, function (res) {
            login(res.username, res.password, resp);
        });
    }
});

/**
 * 登录到社管系统
 *
 * @param username 用户名
 * @param password 密码
 * @param loginResult 回调函数
 */
function login(username, password, loginResult) {
    sendMessage2CurrentTab({username: username, password:password}, function (e) {
        loginResult(e);
    });
}

/**
 * 给当前页面发送消息
 * @param msg 消息对象
 * @param resp 回调函数
 */
function sendMessage2CurrentTab(msg, resp) {
    chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
        if (tabs.length == 0) {
            resp(0);
            return;
        }

        chrome.tabs.sendMessage(tabs[0].id, msg, function (e) {
            resp(e);
        });
    });
}