package tools.loaderservice.api
{
import tools.loaderservice.core.LoaderSignalBus;

public interface LoaderService
{
    function  get on():LoaderSignalBus

    function loadManifest( url:* ):void

    function loadFromXML( xml:XML ):void;

    function load( url:Array ):void;

    function pause():void

    function resume():void

    function flush():void
}
}
