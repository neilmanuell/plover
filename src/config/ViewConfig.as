package config
{
import flash.display.NativeWindow;

import mx.containers.ViewStack;

import mx.controls.ProgressBar;

import plover.view.ApplicationMediator;
import plover.view.ButtonMediator;
import plover.view.DragControlComboMediator;
import plover.view.NativeWindowMediator;
import plover.view.ProgressBarMediator;
import plover.view.SlideMediator;
import plover.view.TabBarMediator;
import plover.view.ViewStackMediator;
import plover.view.components.DragControlCombo;
import plover.view.components.SlideBase;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import spark.components.Button;
import spark.components.TabBar;

public class ViewConfig implements IConfig
{

    [Inject]
    public var mediators:IMediatorMap;

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {
        mediators.map( Button ).toMediator( ButtonMediator );
        mediators.map( SlideBase ).toMediator( SlideMediator );
        mediators.map( DragControlCombo ).toMediator( DragControlComboMediator );
        mediators.map( TabBar ).toMediator( TabBarMediator );
        mediators.map( ViewStack).toMediator( ViewStackMediator );
        mediators.map( ProgressBar ).toMediator( ProgressBarMediator );

        const mainView:ContextView = injector.getInstance( ContextView );
        mediators.map( NativeWindow ).toMediator( NativeWindowMediator );
        mediators.map( Main ).toMediator( ApplicationMediator );
        mediators.mediate( Main );
        mediators.mediate( (mainView.view as Main).nativeWindow );
    }
}
}
