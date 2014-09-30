package plover.model.errors
{
public class GenericErrorReport implements ErrorReport
{
    public function GenericErrorReport( data:* )
    {
        _data = data;
    }
    private var _data:*;

    public function get report():String
    {
        return _data.toString();
    }

    public function get title():String
    {
        return "ERROR";
    }
}
}
