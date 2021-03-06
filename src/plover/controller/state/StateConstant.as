package plover.controller.state
{
public class StateConstant
{
    //public static const START_APPLICATION:String = "action/startApplication";
    public static const NEXT:String = "action/next";
    public static const IDLE:String = "action/idle";
    public static const LOAD_LIST:String = "action/loadList";
    public static const LOAD_IMAGES:String = "action/loadImages";
    public static const QUIT:String = "action/quit";
    public static const OPEN:String = "action/open";
    public static const SAVE:String = "action/save";

    public static const BOOTSTRAPPING:String = "state/bootstrapping";
    public static const START_BOOTSTRAPPING:String = "state/start/bootstrapping";
    public static const TEARDOWN_BOOTSTRAPING:String = "event/tearDown/bootstrap";

    public static const IDLING:String = "event/idling";
    public static const SETUP_IDLING:String = "event/setupIdling";
    public static const TEARDOWN_IDLING:String = "event/tearDownIdling";

    public static const LOADING_IMAGES:String = "state/importing";
    public static const SETUP_LOADING_IMAGES:String = "event/setUp/importing";
    public static const TEARDOWN_LOADING_IMAGES:String = "event/tearDown/importing";
    public static const START_LOADING_IMAGES:String = "event/start/importing";

    public static const LOADING_IMAGES_REVIEW:String = "state/postImporting";
    public static const START_LOADING_IMAGES_REVIEW:String = "event/start/postImporting";

    public static const OPENING:String = "state/opening";
    public static const START_OPENING:String = "event/start/opening";

    public static const OPENING_REVIEW:String = "state/openingReview";
    public static const START_OPENING_REVIEW:String = "event/start/openingReview";
    public static const TEARDOWN_OPENING_REVIEW:String = "event/tearDown/openingReview";

    public static const LOADING_LIST:String = "state/loadingList";
    public static const TEARDOWN_LOADING_LIST:String = "event/tearDown/loadingList";
    public static const START_LOADING_LIST:String = "event/start/loadingList";

    public static const QUITTING:String = "state/exitingApplication";
    public static const START_EXITING_APPLICATION:String = "event/start/exitingApplication";

    public static const SAVING_LIST:String = "state/savingList";
    public static const START_SAVING_LIST:String = "event/start/savingList";

    public static const EDIT_SETTINGS:String = "action/editSettings";
    public static const EDITING_SETTINGS:String = "state/editingSettings";
    public static const START_EDITING_SETTINGS:String = "event/start/editingSettings";

    public static const EXPORT:String = "action/export";
    public static const EXPORTING:String = "state/exporting";
    public static const START_EXPORTING:String = "event/start/exporting";

    public static const CLOSE:String = "action/close";
    public static const CLOSING:String = "state/closing";
    public static const START_CLOSING:String = "state/start/closing";

    public static const INVOKE:String = "action/invoke";
    public static const INVOKING:String = "state/invoking";
    public static const START_INVOKING:String = "state/start/invoking";

    public static const ERROR:String = "action/error";
    public static const ERRORING:String = "state/erroring";
    public static const START_ERRORING:String = "state/start/erroring";

    public static const FSM:XML = <fsm initial={BOOTSTRAPPING}>

        <!-- THE INITIAL STATE -->
        <state name={BOOTSTRAPPING} entering={START_BOOTSTRAPPING} exiting={TEARDOWN_BOOTSTRAPING}>
            <transition action={NEXT} target={IDLING}/>
        </state>

        <state name={IDLING} entering={SETUP_IDLING} exiting={TEARDOWN_IDLING}>
            <transition action={OPEN} target={OPENING}/>
            <transition action={INVOKE} target={INVOKING}/>
            <transition action={SAVE} target={SAVING_LIST}/>
            <transition action={EXPORT} target={EXPORTING}/>
            <transition action={QUIT} target={QUITTING}/>
            <transition action={CLOSE} target={CLOSING}/>
            <transition action={EDIT_SETTINGS} target={EDITING_SETTINGS}/>
        </state>

        <state name={EDITING_SETTINGS} changed={START_EDITING_SETTINGS}>
            <transition action={NEXT} target={IDLING}/>
        </state>

        <state name={CLOSING} changed={START_CLOSING}>
            <transition action={NEXT} target={IDLING}/>
        </state>

        <state name={OPENING} changed={START_OPENING}>
            <transition action={NEXT} target={OPENING_REVIEW}/>
        </state>

        <state name={INVOKING} changed={START_INVOKING}>
            <transition action={NEXT} target={OPENING_REVIEW}/>
        </state>

        <state name={OPENING_REVIEW} exiting={TEARDOWN_OPENING_REVIEW}  changed={START_OPENING_REVIEW}>
            <transition action={IDLE} target={IDLING}/>
            <transition action={LOAD_LIST} target={LOADING_LIST}/>
            <transition action={LOAD_IMAGES} target={LOADING_IMAGES}/>
            <transition action={ERROR} target={ERRORING}/>
        </state>

        <state name={SAVING_LIST}  changed={START_SAVING_LIST}>
            <transition action={IDLE} target={IDLING}/>
        </state>

        <state name={EXPORTING} changed={START_EXPORTING}>
            <transition action={IDLE} target={IDLING}/>
            <transition action={EXPORT} target={EXPORTING}/>
        </state>

        <state name={ERRORING} changed={START_ERRORING}>
            <transition action={IDLE} target={IDLING}/>
        </state>

        <state name={LOADING_LIST} exiting={TEARDOWN_LOADING_LIST} changed={START_LOADING_LIST}>
            <transition action={LOAD_IMAGES} target={LOADING_IMAGES}/>
            <transition action={IDLE} target={IDLING}/>
        </state>

        <state name={LOADING_IMAGES} entering={SETUP_LOADING_IMAGES} exiting={TEARDOWN_LOADING_IMAGES} changed={START_LOADING_IMAGES}>
            <transition action={NEXT} target={LOADING_IMAGES_REVIEW}/>
        </state>

        <state name={LOADING_IMAGES_REVIEW}  changed={START_LOADING_IMAGES_REVIEW}>
            <transition action={IDLE} target={IDLING}/>
            <transition action={SAVE} target={SAVING_LIST}/>
        </state>

        <state name={QUITTING} changed={START_EXITING_APPLICATION}>

        </state>
    </fsm>;
}
}
