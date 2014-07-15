package config
{
import plover.controller.constants.DragControllerNames;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import tools.mouse.AbsoluteDragController;
import tools.mouse.DragControllerMap;
import tools.mouse.RelativeDragController;

public class MouseDragConfig implements IConfig
{

    [Inject]
    public var injector:IInjector;

    public function configure():void
    {

        const map:DragControllerMap = new DragControllerMap();
        map.add( injector.instantiateUnmapped( AbsoluteDragController ), DragControllerNames.ABSOLUTE_DRAG_CONTROL );
        map.add( injector.instantiateUnmapped( RelativeDragController ), DragControllerNames.RELATIVE_DRAG_CONTROL );
        injector.map( DragControllerMap ).toValue( map );

    }
}
}