<?php

namespace App\Jobs;

use PhpMqtt\Client\Facades\MQTT;
use Illuminate\Support\Facades\Log;

class NotifyViaMqtt
{
    protected $event;
    protected $message;
    

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($event, $message)
    {
        $this->event = $event;
        $this->message = $message;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        try {
            Log::info(config('app.mqtt_unique_topic_name').'_'.$this->event);
            MQTT::publish(config('app.mqtt_unique_topic_name').'_'.$this->event, $this->message);
        } catch (\Exception $e) {
            Log::error($this->message);
        }
    }
}
