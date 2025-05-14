<?php

namespace App\Notifications;

use App\Models\exercise_recommendation;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DoctorNewExerciseRecommandationNotfication extends Notification
{
    use Queueable;
    private $exercise_recommendation;
    /**
     * Create a new notification instance.
     */
    public function __construct(exercise_recommendation $exercise_recommendation)
    {
        $this->exercise_recommendation = $exercise_recommendation;
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
            'id' => $this->exercise_recommendation->id, 
            'title' => 'New Recommandation Added exercise'.' '.$this->exercise_recommendation->exercise->exercise_name,
            'data' => 'this recommendation at '.$this->exercise_recommendation->created_at,
            'notifiable_id' => $this->exercise_recommendation->patient_id
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
