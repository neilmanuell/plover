package plover.model.errors
{
public class ErrorRegistry
{

    private var _activeReport:ErrorReport;

    public function get activeReport():ErrorReport
    {
        return _activeReport;
    }

    public function set activeReport( value:ErrorReport ):void
    {
        _activeReport = value;
    }
}
}
