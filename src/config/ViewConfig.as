package config
{
import flash.display.NativeWindow;

import mx.containers.ViewStack;
import mx.controls.FlexNativeMenu;

import plover.view.ApplicationMediator;
import plover.view.MenuMediator;
import plover.view.NativeWindowMediator;
import plover.view.ViewStackMediator;
import plover.view.components.dialogues.MemorySettingsForm;
import plover.view.components.dialogues.MemorySettingsFormMediator;
import plover.view.components.dialogues.ProgressDialogue;
import plover.view.components.dialogues.ProgressDialogueMediator;
import plover.view.components.editor.Editor;
import plover.view.components.editor.EditorMediator;
import plover.view.components.slide.Slide;
import plover.view.components.slide.SlideMediator;
import plover.view.components.splash.Splash;
import plover.view.components.splash.SplashMediator;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class ViewConfig implements IConfig
{

    [Inject]
    public var mediators:IMediatorMap;

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {
        mediators.map( Slide ).toMediator( SlideMediator );
        mediators.map( Editor ).toMediator( EditorMediator );
        mediators.map( ViewStack ).toMediator( ViewStackMediator );
        mediators.map( ProgressDialogue ).toMediator( ProgressDialogueMediator );
        mediators.map( MemorySettingsForm ).toMediator( MemorySettingsFormMediator );
        mediators.map( Splash ).toMediator( SplashMediator );

        const mainView:ContextView = injector.getInstance( ContextView );
        mediators.map( FlexNativeMenu ).toMediator( MenuMediator );
        mediators.map( NativeWindow ).toMediator( NativeWindowMediator );
        mediators.map( Main ).toMediator( ApplicationMediator );
        mediators.mediate( Main );
        mediators.mediate( (mainView.view as Main).nativeWindow );
        mediators.mediate( (mainView.view as Main).menu );
    }
}
}
