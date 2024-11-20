<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactMessage extends Mailable
{
    use Queueable, SerializesModels;
    public $data;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('New Contact Message')
        ->from($this->data['email'], $this->data['name']) // Optional: sender's name and email
        ->to('admin@example.com') // Replace with your recipient email
        ->text('emails.plain_contact_message') // Plain text content
        ->with('data', $this->data); // Pass data
    }
}
