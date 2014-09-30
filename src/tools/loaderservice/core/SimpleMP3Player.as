package tools.loaderservice.core
{
import com.greensock.loading.MP3Loader;

import flash.media.SoundChannel;

import tools.loaderservice.api.MP3Player;

public class SimpleMP3Player implements MP3Player
{
    public function SimpleMP3Player( loader:MP3Loader ):void
    {
        _loader = loader;
    }
    private var _loader:MP3Loader;

    public function gotoSoundTime( time:Number, forcePlay:Boolean = false, resetRepeatCount:Boolean = true ):void
    {
        if ( _loader == null )return;
        _loader.gotoSoundTime( time, forcePlay, resetRepeatCount );
    }

    public function pauseSound():void
    {
        if ( _loader == null )return;
        _loader.pauseSound()
    }

    public function playSound():SoundChannel
    {
        if ( _loader == null )return null;
        return _loader.playSound();
    }
}
}
