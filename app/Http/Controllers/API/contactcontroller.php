<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Mail\ContactMessage;
use Illuminate\Support\Facades\Mail;

class contactcontroller extends Controller
{
    public function sendContactMessage(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'message' => 'required|string',
        ]);

        $data = $request->only(['name', 'email', 'message']);

        // Send the email
        Mail::raw("New Contact Message:\n\nName: {$data['name']}\nEmail: {$data['email']}\nMessage: {$data['message']}", function ($message) use ($data) {
            $message->to('shery@alitacode.com') // Recipient email
                ->subject('New Contact Message') // Email subject
                ->from($data['email'], $data['name']); // Sender's email and name
        });

        return response()->json(['message' => 'Contact message sent successfully!']);
    }
}
