package plover.model.errors
{
public class GenericErrorReport implements ErrorReport
{
    private var _data:*;

    public function get report():String
    {
        return _data.toString();
    }

    public function get title():String
    {
        return "ERROR";
    }

    public function GenericErrorReport( data:* )
    {
        _data = data;
    }
}
}
