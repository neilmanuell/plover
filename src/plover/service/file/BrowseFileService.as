package plover.service.file
{
import tools.signals.Signal1;

public interface BrowseFileService
{
     function browse():Signal1
    function get results(): ImageServiceResults
    function get browseComplete():Signal1
}
}
