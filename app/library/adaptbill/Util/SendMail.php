<?php

/**
 * Send Mail utility.
 * 
 * @author Carlos 
 * @since 09/01/2009
 * @version 0.1.2
 */
class Util_SendMail {

    private $zend_mail = null;
    private $transport = null;

    /**
     * Constructor
     * @return Zend_Mail
     */
    public function __construct($x_charset = 'UTF-8') {
//		if('transport') # @todo pegar o tipo de transport da session config
//			$this->setTransport();

        return $this->zend_mail = new Zend_Mail($x_charset);
    }

    /**
     * Add attachment to eamil.
     *
     * @param $x_attachment
     * @return Zend_Mail
     */
    public function addAttachment(Zend_Mime_Part $x_attachment) {
        return $this->zend_mail->addAttachment($x_attachment);
    }

    public function addBcc($x_mail) {
        return $this->zend_mail->addBcc($x_mail);
    }

    /**
     * Add copy(s) to email.
     *
     * @param $x_mail
     * @param $x_name
     * @return Zend_Mail
     */
    public function addCc($x_mail, $x_name = '') {
        return $this->zend_mail->addCc($x_mail, $x_name);
    }

    /**
     * Add header to email.
     *
     * @param $x_name
     * @param $x_value
     * @param $x_append
     * @return Zend_Mail
     */
    public function addHeader($x_name, $x_value, $x_append) {
        try {
            return $this->zend_mail->addHeader($x_name, $x_value, $x_append);
        } catch (Zend_Mail_Exception $e) {
            throw new Zend_Mail_Exception(AB_MSG_EMAIL_HEADER_FAIL);
        }
    }

    public function addPart(Zend_Mime_Part $x_part) {
        $this->zend_mail->addPart($x_part);
    }

    /**
     * Add recipient to email.
     *
     * @param $x_mail
     * @param $name
     * @return Zend_Mail
     */
    public function addTo($x_mail, $name) {
        return $this->zend_mail->addTo($x_mail, $name);
    }

    public function createAttachment($x_body, $x_mimeType, $x_disposition, $x_encoding, $x_filename) {
        return $this->zend_mail->createAttachment($x_body, $x_mimeType, $x_disposition, $x_encoding, $x_filename);
    }

    /**
     * Add sender to email.
     *
     * @param $x_message
     * @param $x_boundary
     * @param $x_EOL
     * @return Zend_Mail
     */
    public function createFromMessage($x_message, $x_boundary, $x_EOL) {
        try {
            return $this->zend_mail->createFromMessage($x_message, $x_boundary, $x_EOL);
        } catch (Zend_Exception $e) {
            throw new Zend_Mail_Exception(AB_MSG_EMAIL_MIME_HEADER_FAIL);
        }
    }

    /**
     * Send email.
     *
     * @return Zend_Mail
     */
    public function send() {
        return $this->zend_mail->send($this->transport);
    }

    /**
     * Set HTML body in email.
     *
     * @param $x_html
     * @param $x_charset
     * @param $x_encoding
     * @return Zend_Mail
     */
    public function setBodyHtml($x_html, $x_charset = null, $x_encoding = Zend_Mime::ENCODING_QUOTEDPRINTABLE) {
        return $this->zend_mail->setBodyHtml($x_html, $x_charset, $x_encoding);
    }

    /**
     * Set plain text in email.
     *
     * @param $x_txt
     * @param $x_charset
     * @param $x_encoding
     * @return Zend_Mail
     */
    public function setBodyText($x_txt, $x_charset = null, $x_encoding = Zend_Mime::ENCODING_QUOTEDPRINTABLE) {
        return $this->zend_mail->setBodyText($x_txt, $x_charset, $x_encoding);
    }

    public function setDefaultTransport(Zend_Mail_Transport_Abstract $x_trasport) {
        $this->zend_mail->setDefaultTransport($x_trasport);
    }

    /**
     * Set recipient of email.
     *
     * @param $x_mail
     * @param $x_name
     * @return Zend_Mail
     */
    public function setFrom($x_mail, $x_name) {
        try {
            return $this->zend_mail->setFrom($x_mail, $x_name);
        } catch (Exception $e) {
            throw new Zend_Mail_Exception(AB_MSG_EMAIL_MIME_HEADER_FAIL);
        }
    }

    /**
     * Set header encoding of email.
     *
     * @param $x_encoding
     * @return Zend_Mail
     */
    public function setHeaderEncoding($x_encoding) {
        try {
            return $this->zend_mail->setHeaderEncoding($x_encoding);
        } catch (Exception $e) {
            throw new Zend_Mail_Exception(AB_MSG_ENCODE_ERROR);
        }
    }

    public function setMime(Zend_Mime $x_mime) {
        $this->zend_mail->setMime($x_mime);
    }

    public function setMimeBoundary($x_boundary) {
        try {
            return $this->zend_mail->setMimeBoundary($x_boundary);
        } catch (Zend_Mail_Exception $e) {
            throw $e;
        }
    }

    public function setParts($x_parts) {
        $this->zend_mail->setParts($x_parts);
    }

    /**
     * Set email subject.
     *
     * @param $x_subject
     * @return Zend_Mail
     */
    public function setSubject($x_subject) {
        try {
            return $this->zend_mail->setSubject($x_subject);
        } catch (Zend_Mail_Exception $e) {
            throw $e;
        }
    }

    /**
     * Set email content type.
     *
     * @param $x_type
     * @return Zend_Mail
     */
    public function setType($x_type) {
        try {
            return $this->zend_mail->setType($x_type);
        } catch (Zend_Mail_Exception $e) {
            throw $e;
        }
    }

    /**
     * Set email transport type. SMTP Only.
     *
     * @return Zend_Mail
     */
    public function setTransport() {
        # @todo set values
        $smtp = 'smtp.gmail.com';
        $x_transp = array('auth' => 'auth',
            'username' => 'account',
            'password' => 'password',
            'ssl' => 'ssl',
            'port' => 'port');
        $this->transport = new Zend_Mail_Transport_Smtp($smtp, $x_transp);
    }

}