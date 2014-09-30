package tools.loaderservice
{
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.bender.framework.api.IInjector;

import tools.loaderservice.api.BitmapDataProvider;
import tools.loaderservice.api.FontLibrary;
import tools.loaderservice.api.JSONProvider;
import tools.loaderservice.api.LoaderService;
import tools.loaderservice.api.SWFProvider;
import tools.loaderservice.api.XMLProvider;
import tools.loaderservice.core.LoaderMaxService;

public class LoaderServiceExtension implements IExtension
{
    public function extend( context:IContext ):void
    {
        var injector:IInjector = context.injector;

        const service:LoaderMaxService = injector.instantiateUnmapped( LoaderMaxService );

        injector.map( LoaderService ).toValue( service );
        injector.map( FontLibrary ).toValue( service );

        injector.map( BitmapDataProvider ).toValue( service );
        injector.map( SWFProvider ).toValue( service );
        injector.map( XMLProvider ).toValue( service );
        injector.map( JSONProvider ).toValue( service );

    }
}
}
