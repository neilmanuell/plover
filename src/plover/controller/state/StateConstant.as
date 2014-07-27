package plover.controller.state
{
public class StateConstant
{
    public static const BOOTSTRAPING:String = "state/bootstrapping";
    public static const START_APPLICATION:String = "action/startApplication";
    public static const BOOTSTRAP:String = "event/bootstrap";

    public static const IDLING:String = "event/idling";
    public static const SETUP_IDLING:String = "event/setupIdling";
    public static const TEARDOWN_IDLING:String = "event/tearDownIdling";
    public static const IDLE:String = "action/idle";
    public static const IMPORT:String = "action/importImages";
    public static const EXIT_APPLICATION:String = "action/exitApplication";


    public static const IMPORTING:String = "state/importing";
    public static const SETUP_IMPORTING:String = "event/setUp/importing";
    public static const TEARDOWN_IMPORTING:String = "event/tearDown/importing";
    public static const START_IMPORTING:String = "event/start/importing";

    public static const POST_IMPORT:String = "action/postImport";
    public static const POST_IMPORTING:String = "state/postImporting";
    public static const START_POST_IMPORTING:String = "event/start/postImporting";

    public static const BROWSE:String = "action/browse";
    public static const BROWSING:String = "state/browsing";
    public static const SETUP_BROWSING:String = "event/setUp/browsing";
    public static const TEARDOWN_BROWSING:String = "event/tearDown/browsing";
    public static const START_BROWSING:String = "event/start/browsing";

    public static const POST_BROWSE:String = "action/postBrowse";
    public static const POST_BROWSING:String = "state/postBrowsing";
    public static const START_POST_BROWSING:String = "event/start/postBrowsing";

    public static const OPEN:String = "action/open";
    public static const OPENING:String = "state/opening";
    public static const SETUP_OPENING:String = "event/setUp/opening";
    public static const TEARDOWN_OPENING:String = "event/tearDown/opening";
    public static const START_OPENING:String = "event/start/opening";

    public static const EXITING_APPLICATION:String = "state/exitingApplication";
    public static const SETUP_EXITING_APPLICATION:String = "event/setUp/exitingApplication";
    public static const START_EXITING_APPLICATION:String = "event/start/exitingApplication";

    public static const SAVE:String = "action/save";
    public static const SAVING:String = "state/saving";
    public static const START_SAVING:String = "event/start/saving";

    public static const BROWSE_FOR_EXPORT:String = "action/browseForExport";
    public static const BROWSING_FOR_EXPORT:String = "state/browsingForExport";
    public static const START_BROWSING_FOR_EXPORT:String = "event/start/browsingForExport";

    public static const EXPORT:String = "action/export";
    public static const EXPORTING:String = "state/exporting";
    public static const SETUP_EXPORTING:String = "state/setUp/exporting";
    public static const START_EXPORTING:String = "event/start/exporting";


    public static const FSM:XML = <fsm initial={BOOTSTRAPING}>

        <!-- THE INITIAL STATE -->
        <state name={BOOTSTRAPING} exiting={BOOTSTRAP}>
            <transition action={START_APPLICATION} target={IDLING}/>
        </state>

        <state name={IDLING} entering={SETUP_IDLING} exiting={TEARDOWN_IDLING}>
            <transition action={BROWSE} target={BROWSING}/>
            <transition action={SAVE} target={SAVING}/>
            <transition action={EXPORT} target={EXPORTING}/>
            <transition action={EXIT_APPLICATION} target={EXITING_APPLICATION}/>
        </state>

        <state name={BROWSING} changed={START_BROWSING}>
            <transition action={POST_BROWSE} target={POST_BROWSING}/>
        </state>

        <state name={POST_BROWSING} changed={START_POST_BROWSING}>
            <transition action={IDLE} target={IDLING}/>
            <transition action={OPEN} target={OPENING}/>
            <transition action={IMPORT} target={IMPORTING}/>
        </state>

        <state name={SAVING}  changed={START_SAVING}>
            <transition action={IDLE} target={IDLING}/>
        </state>

        <state name={BROWSING_FOR_EXPORT} changed={START_BROWSING_FOR_EXPORT}>
            <transition action={IDLE} target={IDLING}/>
            <transition action={EXPORT} target={EXPORTING}/>
        </state>

        <state name={EXPORTING} entering={SETUP_EXPORTING}  changed={START_EXPORTING}>
            <transition action={IDLE} target={IDLING}/>
        </state>

        <state name={OPENING} entering={SETUP_OPENING} exiting={TEARDOWN_OPENING} changed={START_OPENING}>
            <transition action={IMPORT} target={IMPORTING}/>
            <transition action={IDLE} target={IDLING}/>
        </state>

        <state name={IMPORTING} entering={SETUP_IMPORTING} exiting={TEARDOWN_IMPORTING} changed={START_IMPORTING}>
            <transition action={POST_IMPORT} target={POST_IMPORTING}/>
        </state>

        <state name={POST_IMPORTING}  changed={START_POST_IMPORTING}>
            <transition action={IDLE} target={IDLING}/>
            <transition action={SAVE} target={SAVING}/>
        </state>

        <state name={EXITING_APPLICATION} entering={SETUP_EXITING_APPLICATION} changed={START_EXITING_APPLICATION}>

        </state>
    </fsm>;
}
}
