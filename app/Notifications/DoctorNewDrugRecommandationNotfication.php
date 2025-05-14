<?php

namespace App\Notifications;

use App\Models\drug_recommendation;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DoctorNewDrugRecommandationNotfication extends Notification
{
    use Queueable;
    private $drug_recommendation;
    /**
     * Create a new notification instance.
     */
    public function __construct(drug_recommendation $drug_recommendation)
    {
        $this->drug_recommendation = $drug_recommendation;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
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
            'id' => $this->drug_recommendation->id, 
            'title' => 'New Recommandation Added drug'.' '.$this->drug_recommendation->drug->drug_name,
            'data' => 'this recommendation at '.$this->drug_recommendation->created_at,
            'notifiable_id' => $this->drug_recommendation->patient_id
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
