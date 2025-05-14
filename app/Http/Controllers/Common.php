<?php

namespace App\Http\Controllers;
use Carbon\Exceptions\Exception;
use GuzzleHttp\Client;


class Common
{

    public static function checkPhoneRegisteredOnWhatsapp($phone)
    {
        
        $client = new Client();
        $url = 'https://business.enjazatik.com/api/v1/check-number';
        $params = [


            'form_params' => [
                'number' => $phone,
            ],
            'headers' => [
                'Authorization' => 'Bearer ' . env('WHATSAPP_API_TOKEN'),
            ],

        ];

        try {
            $response = $client->request('POST', $url, $params);
            $res = json_decode($response->getBody()->getContents());

            return $res->status;
        } catch (\Exception $e) {
            return response('Error: ' . $e->getMessage(), 500);
        }

    }

    public static function sendWhatsappTextMessage($phone, $message)
    {

       
        $client = new Client();
        $url = 'https://business.enjazatik.com/api/v1/send-message';
        $params = [
            'query' => [
                'number' => $phone,
                'message' => $message,
                'token' => env('WHATSAPP_API_TOKEN')
            ]
        ];

        try {
            $response = $client->request('GET', $url, $params);
            return response($response->getBody()->getContents(), $response->getStatusCode())
                ->header('Content-Type', 'application/json');
        } catch (\Exception $e) {
            return response('Error: ' . $e->getMessage(), 500);
        }
    }

//guzzle

// composer require guzzlehttp/guzzle


}
