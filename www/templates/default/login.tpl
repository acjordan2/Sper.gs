<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru">    
    <head>
        <title>{$sitename} - {$page_title}</title>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />

    </head>
    <body onload="document.getElementsByTagName('input')[0].focus();">
        {if $message != NULL}{$message}{/if}<br />
        <br />
        <form action="" method="POST" autocomplete="off">
          <fieldset style="width:250px;">
            <br />
            {$sm_labels.username}:<br />
            <input type="text" name="username" value="{$username}" style="width:100%;">
            <br /><br />
            {$sm_labels.password}:<br />
            <input type="password" name="password" style="width:100%;">
            <br /><br />
            <input type="submit" value="Login">
          </fieldset>
          <input type="hidden" name="token" value="{$token}" />
        </form>
        <br />
        <a href="./register.php">{$sm_labels.sign_up}</a> | <a href="./passwordReset.php">{$sm_labels.forgot_password}?</a>
    </body>
</html>
