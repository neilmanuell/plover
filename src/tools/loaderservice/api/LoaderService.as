package tools.loaderservice.api
{
import tools.signals.Signal0;

public interface LoaderService
{   function  get queueComplete():Signal0
    function loadManifest( url:* ):void
    function loadFromXML(xml:XML):void;
    function load( url:Array ):void;
    function pause():void
    function resume():void
}
}
