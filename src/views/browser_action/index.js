$(function () {
    chrome.storage.local.get({username: '', password: '', remember: false}, function (res) {
        $('input[name="username"]').val(res.username);
        $('input[name="password"]').val(res.password);
        $('input[name="remember"]').prop('checked', res.remember);
    });

    $('form').submit(function (e) {
        var username = $('input[name="username"]').val();
        var password = $('input[name="password"]').val();
        var remember = $('input[name="remember"]').prop('checked');

        chrome.runtime.sendMessage({
                type: 'login',
                username: username,
                password: password,
                remember: remember
            }
        );

        return false;
    });
});

