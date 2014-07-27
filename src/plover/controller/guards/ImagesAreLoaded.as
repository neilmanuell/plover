package plover.controller.guards
{
import plover.model.slides.SlideCarriage;

public class ImagesAreLoaded
{
    [Inject]
    public var model:SlideCarriage;

    public function approve():Boolean
    {
        return model.numberOfChildren > 0
    }
}
}
