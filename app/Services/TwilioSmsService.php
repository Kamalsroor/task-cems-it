<?php

namespace App\Services;

use Twilio\Rest\Client;

class TwilioSmsService
{
    private $client;

    public function __construct()
    {
        $this->client = new Client(
            config('twilio.sid'),
            config('twilio.token')
        );
    }

    public function send(string $to, string $message): bool
    {

        try {

            $responce  = $this->client->messages->create('+2' . $to, [
                'from' => config('twilio.from'),
                'body' => $message,
            ]);

            return true;
        } catch (\Exception $e) {
            report($e);
            return false;
        }
    }
}
