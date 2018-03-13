chrome.runtime.onMessage.addListener(function(msg, sender, resp) {
    console.log(msg.username, msg.password);
    loginByPwd(msg.username,msg.password);
});


function loginByPwd(username, password) {
    $('#username').val(username);
    $('#password').val(password);
    $("#fm1").submit();
}