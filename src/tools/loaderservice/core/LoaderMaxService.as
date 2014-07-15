package tools.loaderservice.core
{
import com.greensock.events.LoaderEvent;
import com.greensock.loading.BinaryDataLoader;
import com.greensock.loading.ImageLoader;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.MP3Loader;
import com.greensock.loading.SWFLoader;
import com.greensock.loading.XMLLoader;
import com.greensock.loading.core.LoaderCore;
import com.greensock.loading.data.LoaderMaxVars;
import com.greensock.loading.data.XMLLoaderVars;

import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.events.IEventDispatcher;
import flash.net.URLRequest;
import flash.utils.ByteArray;

import tools.loaderservice.api.BinaryDataProvider;
import tools.loaderservice.api.BitmapDataProvider;
import tools.loaderservice.api.LoaderService;
import tools.loaderservice.api.MP3Player;
import tools.loaderservice.api.MP3Provider;
import tools.loaderservice.api.SWFProvider;
import tools.loaderservice.api.XMLProvider;
import tools.loaderservice.data.NULL_BITMAP_DATA;
import tools.loaderservice.data.NULL_BYTE_ARRAY;
import tools.loaderservice.data.NULL_DISPLAY_OBJECT;
import tools.loaderservice.data.NULL_XML;
import tools.signals.Signal0;

use namespace NULL_BITMAP_DATA;

public class LoaderMaxService implements LoaderService, BitmapDataProvider, XMLProvider, BinaryDataProvider, MP3Provider, SWFProvider
{


    private const _queueComplete:Signal0 = new Signal0();

    public function LoaderMaxService( dispatcher:IEventDispatcher )
    {
        _dispatcher = dispatcher;

        LoaderMax.activate( [XMLLoader, ImageLoader, MP3Loader, BinaryDataLoader, SWFLoader] )
    }

    private var _dispatcher:IEventDispatcher;
    private var _loader:LoaderCore;

    public function get queueComplete():Signal0
    {
        return _queueComplete;
    }

    /*
     <MP3Loader url="assets/sound/Sound_Restart_btn.mp3" name="Sound_Restart_btn" autoPlay="false" load="true" repeat="0"/>
     <ImageLoader url="assets/UI/bkg.jpg" name="bkg" load="true"/>
     <XMLLoader url="assets/data/locale.xml" name="locale" load="true"/>
     */

    public function loadManifest( url:* ):void
    {
        url = (url is URLRequest) ? url : new URLRequest( url );
        const v:XMLLoaderVars = new XMLLoaderVars();
        v.name( "LoadManifest" );
        v.onComplete( onComplete );
        v.onProgress( onProgress );
        v.onChildComplete( onChildComplete );
        v.onChildFail( onChildError );

        _loader = new XMLLoader( url, v );
        _loader.load();
    }

    public function loadFromXML( xml:XML ):void
    {
        const v:LoaderMaxVars = new LoaderMaxVars();
        v.name( "LoadManifest" );
        v.onComplete( onComplete );
        v.onProgress( onProgress );
        v.onChildComplete( onChildComplete );
        v.onChildFail( onChildError );

        _loader = new LoaderMax( v );
        XMLLoader.parseLoaders( xml, _loader as LoaderMax );
        _loader.load();

    }

    public function load( urls:Array ):void
    {
        const v:LoaderMaxVars = new LoaderMaxVars();
        v.name( "LoadManifest" );
        v.onComplete( onComplete );
        v.onProgress( onProgress );
        v.onChildComplete( onChildComplete );
        v.onChildFail( onChildError );

        _loader = LoaderMax.parse( urls, v );

        _loader.load();
    }

    public function pause():void
    {
        _loader.pause();
    }

    public function resume():void
    {
        _loader.resume();
    }

    public function getBitmapData( name:String, unload:Boolean = false ):BitmapData
    {
        const loader:ImageLoader = LoaderMax.getLoader( name ) as ImageLoader;
        if ( loader == null || loader.content == null  || loader.content.rawContent == null )
        {
            //  _logger.warn( "Bitmap with the name {0} does not exist. Returning broken image.", [name] );
            return NULL_BITMAP_DATA.clone();
        }

        if( unload)loader.unload();

        return  loader.content.rawContent.bitmapData.clone();
    }

    public function getXML( name:String ):XML
    {
        const loader:XMLLoader = LoaderMax.getLoader( name ) as XMLLoader;
        if ( loader == null )
        {
            //  _logger.warn( "XML with the name {0} does not exist. Returning NULL_XML.", [name] );
            return NULL_XML;
        }

        return loader.content;
    }

    public function getSWF( name:String ):DisplayObject
    {
        const loader:SWFLoader = LoaderMax.getLoader( name ) as SWFLoader;
        if ( loader == null )
        {
            //   _logger.warn( "SWF with the name {0} does not exist. Returning NULL_DISPLAY_OBJECT.", [name] );
            return NULL_DISPLAY_OBJECT;
        }

        return loader.rawContent
    }

    public function getByteArray( name:String ):ByteArray
    {
        const loader:BinaryDataLoader = LoaderMax.getLoader( name ) as BinaryDataLoader;
        if ( loader == null )
        {
            //    _logger.warn( "ByteArray with the name {0} does not exist. Returning NULL_BYTE_ARRAY.", [name] );
            return NULL_BYTE_ARRAY;
        }
        return loader.content;
    }

    public function getMP3Player( name:String ):MP3Player
    {
        const loader:MP3Loader = LoaderMax.getLoader( name ) as MP3Loader;
        const player:MP3Player = new SimpleMP3Player( loader );

        if ( loader == null )
        {
            //       _logger.warn( "ByteArray with the name {0} does not exist. Returning empty MP3Player.", [name] );
        }

        return player;

    }

    private function onChildError( event:LoaderEvent ):void
    {
        //  _logger.error( "File {0} did not load correctly.", [event.target.url] );
        _dispatcher.dispatchEvent( event );
    }

    private function onChildComplete( event:LoaderEvent ):void
    {
        //   _logger.info( "File {0} load complete.", [event.target.url] );
    }

    private function onProgress( event:LoaderEvent ):void
    {
        _dispatcher.dispatchEvent( event );

    }

    private function onComplete( event:LoaderEvent ):void
    {
        //  _logger.info( "Load Queue Completed." );
        _queueComplete.dispatch();
        _dispatcher.dispatchEvent( event );
    }
}
}
