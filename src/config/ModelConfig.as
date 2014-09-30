package config
{
import plover.model.errors.ErrorRegistry;
import plover.model.files.ExportFileModel;
import plover.model.files.ImportFileModel;
import plover.model.settings.BitmapMemorySettings;
import plover.model.slides.SlideCarriage;
import plover.service.memory.BitmapMemoryModel;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import tools.mouse.DragControllerClient;

public class ModelConfig implements IConfig
{

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {
        injector.map( SlideCarriage ).asSingleton();
        injector.map( ImportFileModel ).asSingleton();
        injector.map( ExportFileModel ).asSingleton();
        injector.map( BitmapMemorySettings ).asSingleton();
        injector.map( BitmapMemoryModel ).asSingleton();
        injector.map( ErrorRegistry ).asSingleton();
        injector.map( DragControllerClient ).toValue( injector.getInstance( SlideCarriage ) );
    }
}
}
