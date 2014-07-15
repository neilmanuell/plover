package tools.loaderservice.api
{
import flash.media.SoundChannel;

public interface MP3Player
{
    function gotoSoundTime( time:Number, forcePlay:Boolean = false, resetRepeatCount:Boolean = true ):void

    function pauseSound():void

    function playSound():SoundChannel
}
}
