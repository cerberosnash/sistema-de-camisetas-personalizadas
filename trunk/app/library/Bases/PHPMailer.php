<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Base_PHPMailer
 *
 * @author Michael
 */
class Base_PHPMailer extends PHPMailer {

    public $Priority = 3;
    /**
     * Sets the CharSet of the message.
     * @var string
     */
    public $CharSet = 'utf-8';
    /**
     * Sets the Content-type of the message.
     * @var string
     */
    public $ContentType = 'text/html';
    /**
     * Sets the Encoding of the message. Options for this are
     *  "8bit", "7bit", "binary", "base64", and "quoted-printable".
     * @var string
     */
    public $Encoding = '8bit';
    /**
     * Holds the most recent mailer error message.
     * @var string
     */
    public $ErrorInfo = '';
    /**
     * Sets the From email address for the message.
     * @var string
     */
    public $From = 'root@localhost';
    /**
     * Sets the From name of the message.
     * @var string
     */
    public $FromName = 'Root User';
    /**
     * Sets the Sender email (Return-Path) of the message.  If not empty,
     * will be sent via -f to sendmail or as 'MAIL FROM' in smtp mode.
     * @var string
     */
    public $Sender = '';
    /**
     * Sets the Subject of the message.
     * @var string
     */
    public $Subject = '';
    /**
     * Sets the Body of the message.  This can be either an HTML or text body.
     * If HTML then run IsHTML(true).
     * @var string
     */
    public $Body = '';
    /**
     * Sets the text-only body of the message.  This automatically sets the
     * email to multipart/alternative.  This body can be read by mail
     * clients that do not have HTML email capability such as mutt. Clients
     * that can read HTML will view the normal Body.
     * @var string
     */
    public $AltBody = '';
    /**
     * Sets word wrapping on the body of the message to a given number of
     * characters.
     * @var int
     */
    public $WordWrap = 0;
    /**
     * Method to send mail: ("mail", "sendmail", or "smtp").
     * @var string
     */
    public $Mailer = 'mail';
    /**
     * Sets the path of the sendmail program.
     * @var string
     */
    public $Sendmail = '/usr/sbin/sendmail';
    /**
     * Path to PHPMailer plugins.  Useful if the SMTP class
     * is in a different directory than the PHP include path.
     * @var string
     */
    public $PluginDir = '';
    /**
     * Sets the email address that a reading confirmation will be sent.
     * @var string
     */
    public $ConfirmReadingTo = '';
    /**
     * Sets the hostname to use in Message-Id and Received headers
     * and as default HELO string. If empty, the value returned
     * by SERVER_NAME is used or 'localhost.localdomain'.
     * @var string
     */
    public $Hostname = '';
    /**
     * Sets the message ID to be used in the Message-Id header.
     * If empty, a unique id will be generated.
     * @var string
     */
    public $MessageID = '';
    /////////////////////////////////////////////////
    // PROPERTIES FOR SMTP
    /////////////////////////////////////////////////
    /**
     * Sets the SMTP hosts.  All hosts must be separated by a
     * semicolon.  You can also specify a different port
     * for each host by using this format: [hostname:port]
     * (e.g. "smtp1.example.com:25;smtp2.example.com").
     * Hosts will be tried in order.
     * @var string
     */
    public $Host = 'localhost';
    /**
     * Sets the default SMTP server port.
     * @var int
     */
    public $Port = 25;
    /**
     * Sets the SMTP HELO of the message (Default is $Hostname).
     * @var string
     */
    public $Helo = '';
    /**
     * Sets connection prefix.
     * Options are "", "ssl" or "tls"
     * @var string
     */
    public $SMTPSecure = '';
    /**
     * Sets SMTP authentication. Utilizes the Username and Password variables.
     * @var bool
     */
    public $SMTPAuth = false;
    /**
     * Sets SMTP username.
     * @var string
     */
    public $Username = '';
    /**
     * Sets SMTP password.
     * @var string
     */
    public $Password = '';
    /**
     * Sets the SMTP server timeout in seconds.
     * This function will not work with the win32 version.
     * @var int
     */
    public $Timeout = 10;
    /**
     * Sets SMTP class debugging on or off.
     * @var bool
     */
    public $SMTPDebug = false;
    /**
     * Prevents the SMTP connection from being closed after each mail
     * sending.  If this is set to true then to close the connection
     * requires an explicit call to SmtpClose().
     * @var bool
     */
    public $SMTPKeepAlive = false;
    /**
     * Provides the ability to have the TO field process individual
     * emails, instead of sending to entire TO addresses
     * @var bool
     */
    public $SingleTo = false;
    /**
     * If SingleTo is true, this provides the array to hold the email addresses
     * @var bool
     */
    public $SingleToArray = array();
    /**
     * Provides the ability to change the line ending
     * @var string
     */
    public $LE = "\n";
    /**
     * Used with DKIM DNS Resource Record
     * @var string
     */
    public $DKIM_selector = 'phpmailer';
    /**
     * Used with DKIM DNS Resource Record
     * optional, in format of email address 'you@yourdomain.com'
     * @var string
     */
    public $DKIM_identity = '';
    /**
     * Used with DKIM DNS Resource Record
     * optional, in format of email address 'you@yourdomain.com'
     * @var string
     */
    public $DKIM_domain = '';
    /**
     * Used with DKIM DNS Resource Record
     * optional, in format of email address 'you@yourdomain.com'
     * @var string
     */
    public $DKIM_private = '';
    /**
     * Callback Action function name
     * the function that handles the result of the send email action. Parameters:
     *   bool    $result        result of the send action
     *   string  $to            email address of the recipient
     *   string  $cc            cc email addresses
     *   string  $bcc           bcc email addresses
     *   string  $subject       the subject
     *   string  $body          the email body
     * @var string
     */
    public $action_function = ''; //'callbackAction';
    /**
     * Sets the PHPMailer Version number
     * @var string
     */
    public $Version = '5.1';
    /////////////////////////////////////////////////
    // PROPERTIES, PRIVATE AND PROTECTED
    /////////////////////////////////////////////////
    private $smtp = NULL;
    private $to = array();
    private $cc = array();
    private $bcc = array();
    private $ReplyTo = array();
    private $all_recipients = array();
    private $attachment = array();
    private $CustomHeader = array();
    private $message_type = '';
    private $boundary = array();
    protected $language = array();
    private $error_count = 0;
    private $sign_cert_file = "";
    private $sign_key_file = "";
    private $sign_key_pass = "";
    private $exceptions = false;

    /////////////////////////////////////////////////
    // CONSTANTS
    /////////////////////////////////////////////////

    const STOP_MESSAGE = 0; // message only, continue processing
    const STOP_CONTINUE = 1; // message?, likely ok to continue processing
    const STOP_CRITICAL = 2; // message, plus full stop, critical error reached
    /////////////////////////////////////////////////
    // METHODS, VARIABLES
    /////////////////////////////////////////////////

    /**
     * Constructor
     * @param boolean $exceptions Should we throw external exceptions?
     */
    public function __construct($exceptions = false) {
        $this->exceptions = ($exceptions == true);

        $this->SMTPDebug = SYSTEM_SMTP_DEBUGGER ? 2 : 1;                       // USE O 2 PARA HABILITAR E 1 PARA DESABILITAR O MODO DEBUG
        $this->SMTPAuth = true;                    // nao altere
        $this->SMTPSecure = "ssl";                   // nao altere
        $this->Host = SYSTEM_SMTP_HOST;  // nao altere
        $this->Port = SYSTEM_SMTP_PORT;                     // nao altere
        $this->Username = SYSTEM_EMAIL_USER; // Seu email do GMAIL
        $this->Password = SYSTEM_EMAIL_PASS;         // Sua senha do GMAIL
        $this->SetLanguage("br", SYSTEM_PATH_ABSOLUTE . "/library/Base/Smtp/language/"); //nao altere
        $this->IsSMTP();
        $this->IsHTML(true);
        $this->SetFrom(SYSTEM_EMAIL_ADDRESS_FROM, SYSTEM_EMAIL_NAME_FROM);
    }

}

?>
