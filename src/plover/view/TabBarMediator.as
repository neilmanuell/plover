package plover.view
{
import flash.events.Event;

import mx.collections.ArrayCollection;

import plover.controller.events.ViewEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import spark.components.TabBar;

public class TabBarMediator extends Mediator
{

    [Inject]
    public var view:TabBar;


    override public function initialize():void
    {
        addContextListener(ViewEvent.ADD, onViewAdd)    ;
        addViewListener(Event.CHANGE, onChange);
        view.dataProvider = new ArrayCollection();

    }

    private function onChange(event:Event):void
    {
                                         trace("")
    }

    private function onViewAdd(event:ViewEvent):void
    {
       view.dataProvider.addItem(event.screen);
    }


}
}
