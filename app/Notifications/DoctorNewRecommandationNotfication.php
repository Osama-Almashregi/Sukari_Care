<?php

namespace App\Notifications;

use App\Models\meal;
use App\Models\meal_recommendation;
use App\Models\patient;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DoctorNewRecommandationNotfication extends Notification
{
    use Queueable;

    private $meal_recommendation;

    public function __construct(meal_recommendation $meal_recommendation)
    {
         $this->meal_recommendation = $meal_recommendation;
    }

    public function via(object $notifiable): array
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toDatabase()
    {
      return [
        'id' => $this->meal_recommendation->id, 
        'title' => 'وصفةغذائية جديدة',
        'data' => ' لقد تم اضافة وصفة غذاية  '.$this->meal_recommendation->meal->meal_name,
        'notifiable_id' => $this->meal_recommendation->patient_id
      ];  
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}
