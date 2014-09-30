package tools.loaderservice.core
{
import tools.signals.Signal0;
import tools.signals.Signal1;
import tools.signals.Signal2;

public class LoaderSignalBus
{
    public const itemComplete:Signal1 = new Signal1( String );
    public const queueComplete:Signal0 = new Signal0();
    public const queueProgress:Signal2 = new Signal2( Number, Number );

    public function removeAll():void
    {
        queueComplete.removeAll();
        itemComplete.removeAll();
        queueProgress.removeAll();
    }
}
}
