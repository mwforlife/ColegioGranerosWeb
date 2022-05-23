<?php
$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['mensaje'];
$phone = $_POST['phone'];


// allow for demo mode testing of emails
define("DEMO", false); // setting to TRUE will stop the email from sending.

// set the location of the template file to be loaded
$template_file = "../templates/contact__template.php";

// set the email 'from' information
$email_from = "Colegio Graneros - Contactos <wilkenstech@gmail.com>";

// create a list of the variables to be swapped in the html template
$swap_var = array(
    "{SITE_ADDR}" => "https://www.colegiograneros.cl",
    "{EMAIL_LOGO}" => "https://colegiograneros.cl/Inventario/img/logo/log.png",
    "{EMAIL_TITLE}" => "Mensaje desde el sitio web",
    "{CUSTOM_URL}" => "https://colegiograneros.cl/",
    "{CUSTOM_IMG}" => "",
    "{TO_NAME}" => $name,
    "{TO_EMAIL}" => $email,
    "{FROM_NAME}" => $name,
    "{EMAIL}" => $email,
    "{PHONE}" => $phone,
    "{MESSAGE}" => $message
);

// create the email headers to being the email
$email_headers = "From: ".$email_from."\r\nReply-To: ".$email_from."\r\n";
$email_headers .= "MIME-Version: 1.0\r\n";
$email_headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

// load the email to and subject from the $swap_var
$email_to ="mwforlife24@gmail.com";
$email_subject = $swap_var['{EMAIL_TITLE}']; // you can add time() to get unique subjects for testing: time();

// load in the template file for processing (after we make sure it exists)
if (file_exists($template_file)){
    $email_message = file_get_contents($template_file);
}else{
    die ("Unable to locate your template file");
}
// search and replace for predefined variables, like SITE_ADDR, {NAME}, {lOGO}, {CUSTOM_URL} etc
foreach (array_keys($swap_var) as $key){
    if (strlen($key) > 2 && trim($swap_var[$key]) != '')
        $email_message = str_replace($key, $swap_var[$key], $email_message);
}

// check if the email script is in demo mode, if it is then dont actually send an email
if (DEMO){
    die("<hr /><center>This is a demo of the HTML email to be sent. No email was sent. </center>");
}
// send the email out to the user  
    if (mail($email_to, $email_subject, $email_message, $email_headers)){
        echo 1;
    } else {
        echo "The email message was not sent.";
    }