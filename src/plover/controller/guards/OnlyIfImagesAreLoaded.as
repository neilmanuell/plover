package plover.controller.guards
{
import plover.model.slides.SlideCarriage;

public class OnlyIfImagesAreLoaded
{
    [Inject]
    public var model:SlideCarriage;

    public function approve():Boolean
    {
        return model.numberOfChildren > 0
    }
}
}
