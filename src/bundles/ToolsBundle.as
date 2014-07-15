package bundles
{
import robotlegs.bender.framework.api.IBundle;
import robotlegs.bender.framework.api.IContext;

import tools.loaderservice.LoaderServiceExtension;

public class ToolsBundle implements IBundle
{

    public function extend( context:IContext ):void
    {
        context.install(
                LoaderServiceExtension );
    }
}
}