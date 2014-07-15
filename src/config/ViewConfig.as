package config
{
import flash.display.NativeWindow;

import plover.view.ButtonMediator;
import plover.view.DragControlComboMediator;
import plover.view.NativeWindowMediator;
import plover.view.SlideMediator;
import plover.view.components.DragControlCombo;
import plover.view.components.Slide;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import spark.components.Button;

public class ViewConfig implements IConfig
{

    [Inject]
    public var mediators:IMediatorMap;

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {
        mediators.map( Button ).toMediator( ButtonMediator );
        mediators.map( Slide ).toMediator( SlideMediator );
        mediators.map( DragControlCombo ).toMediator( DragControlComboMediator );

        const mainView:ContextView = injector.getInstance( ContextView );
        mediators.map( NativeWindow ).toMediator( NativeWindowMediator );
        mediators.mediate( (mainView.view as Main).nativeWindow );
    }
}
}
