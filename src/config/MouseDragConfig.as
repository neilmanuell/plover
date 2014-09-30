package config
{
import plover.controller.constants.ActionNames;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import tools.mouse.AbsoluteDragController;
import tools.mouse.AbsoluteTweenedDragController;
import tools.mouse.DragControllerMap;
import tools.mouse.RelativeDragController;
import tools.mouse.RelativeTweenedDragController;

public class MouseDragConfig implements IConfig
{

    [Inject]
    public var injector:IInjector;

    public function configure():void
    {

        const map:DragControllerMap = new DragControllerMap();
        map.add( injector.instantiateUnmapped( RelativeDragController ), ActionNames.DRAG_CONTROLLERS[0] );
        map.add( injector.instantiateUnmapped( RelativeTweenedDragController ), ActionNames.DRAG_CONTROLLERS[1], true );
        map.add( injector.instantiateUnmapped( AbsoluteDragController ), ActionNames.DRAG_CONTROLLERS[2] );
        map.add( injector.instantiateUnmapped( AbsoluteTweenedDragController ), ActionNames.DRAG_CONTROLLERS[3] );
        injector.map( DragControllerMap ).toValue( map );

    }
}
}