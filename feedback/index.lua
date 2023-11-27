--A simple module for handling SGJourney Stargate feedback codes

local FeedbackType = {}
FeedbackType.INFO = 0
FeedbackType.ERROR = 1
FeedbackType.MAJOR_ERROR = 2
function FeedbackType.getName(enum)
    for k,v in pairs(FeedbackType) do
        if v == enum then
            return k
        end
    end
    return nil
end

local Feedback = {}
Feedback.__index = Feedback

function Feedback.new(code, type, common_name)
    local newFeedback = {}
    newFeedback.code = code
    newFeedback.type = type
    newFeedback.common_name = common_name

    setmetatable(newFeedback,Feedback)

    return newFeedback
end

local FeedbackEnum = {}

FeedbackEnum.NONE = Feedback.new(0, FeedbackType.INFO, "No feedback provided.")
FeedbackEnum.UNKNOWN_ERROR = Feedback.new(-1, FeedbackType.ERROR, "An unknown error has occurred.")
FeedbackEnum.SYMBOL_ENCODED = Feedback.new(1, FeedbackType.INFO, "The symbol has been successfully encoded.")
FeedbackEnum.SYMBOL_IN_ADDRESS = Feedback.new(-2, FeedbackType.ERROR, "The symbol is present in the address.")
FeedbackEnum.SYMBOL_OUT_OF_BOUNDS = Feedback.new(-3, FeedbackType.ERROR, "The symbol is out of bounds.")
FeedbackEnum.CONNECTION_ESTABLISHED_SYSTEM_WIDE = Feedback.new(2, FeedbackType.INFO, "A system-wide connection has been established.")
FeedbackEnum.CONNECTION_ESTABLISHED_INTERSTELLAR = Feedback.new(3, FeedbackType.INFO, "An interstellar connection has been established.")
FeedbackEnum.CONNECTION_ESTABLISHED_INTERGALACTIC = Feedback.new(4, FeedbackType.INFO, "An intergalactic connection has been established.")
FeedbackEnum.INCOMPLETE_ADDRESS = Feedback.new(-4, FeedbackType.ERROR, "The address is incomplete.")
FeedbackEnum.INVALID_ADDRESS = Feedback.new(-5, FeedbackType.MAJOR_ERROR, "The address is invalid.")
FeedbackEnum.NOT_ENOUGH_POWER = Feedback.new(-6, FeedbackType.MAJOR_ERROR, "There is not enough power.")
FeedbackEnum.SELF_OBSTRUCTED = Feedback.new(-7, FeedbackType.MAJOR_ERROR, "The device is obstructing itself.")
FeedbackEnum.TARGET_OBSTRUCTED = Feedback.new(-8, FeedbackType.ERROR, "The target is obstructed.")
FeedbackEnum.SELF_DIAL = Feedback.new(-9, FeedbackType.MAJOR_ERROR, "The device is dialing itself.")
FeedbackEnum.SAME_SYSTEM_DIAL = Feedback.new(-10, FeedbackType.MAJOR_ERROR, "The device is dialing within the same system.")
FeedbackEnum.ALREADY_CONNECTED = Feedback.new(-11, FeedbackType.MAJOR_ERROR, "The device is already connected.")
FeedbackEnum.NO_GALAXY = Feedback.new(-12, FeedbackType.MAJOR_ERROR, "There is no galaxy.")
FeedbackEnum.NO_DIMENSIONS = Feedback.new(-13, FeedbackType.MAJOR_ERROR, "There are no dimensions.")
FeedbackEnum.NO_STARGATES = Feedback.new(-14, FeedbackType.MAJOR_ERROR, "There are no stargates.")
FeedbackEnum.CONNECTION_ENDED_BY_DISCONNECT = Feedback.new(7, FeedbackType.INFO, "The connection was ended by a disconnect.")
FeedbackEnum.CONNECTION_ENDED_BY_POINT_OF_ORIGIN = Feedback.new(8, FeedbackType.INFO, "The connection was ended by the point of origin.")
FeedbackEnum.CONNECTION_ENDED_BY_NETWORK = Feedback.new(9, FeedbackType.INFO, "The connection was ended by the network.")
FeedbackEnum.CONNECTION_ENDED_BY_AUTOCLOSE = Feedback.new(10, FeedbackType.INFO, "The connection was ended by autoclose.")
FeedbackEnum.EXCEEDED_CONNECTION_TIME = Feedback.new(-15, FeedbackType.ERROR, "The connection time was exceeded.")
FeedbackEnum.RAN_OUT_OF_POWER = Feedback.new(-16, FeedbackType.ERROR, "The device ran out of power.")
FeedbackEnum.CONNECTION_REROUTED = Feedback.new(-17, FeedbackType.ERROR, "The connection was rerouted.")
FeedbackEnum.WRONG_DISCONNECT_SIDE = Feedback.new(-18, FeedbackType.ERROR, "The disconnect was initiated from the wrong side.")
FeedbackEnum.CONNECTION_FORMING = Feedback.new(-19, FeedbackType.ERROR, "The connection is currently forming.")
FeedbackEnum.STARGATE_DESTROYED = Feedback.new(-20, FeedbackType.ERROR, "The stargate was destroyed.")
FeedbackEnum.COULD_NOT_REACH_TARGET_STARGATE = Feedback.new(-21, FeedbackType.MAJOR_ERROR, "The target stargate could not be reached.")
FeedbackEnum.INTERRUPTED_BY_INCOMING_CONNECTION = Feedback.new(-22, FeedbackType.ERROR, "The process was interrupted by an incoming connection.")
FeedbackEnum.CHEVRON_RAISED = Feedback.new(11, FeedbackType.INFO, "The chevron was raised.")
FeedbackEnum.CHEVRON_ALREADY_RAISED = Feedback.new(-22, FeedbackType.ERROR, "The chevron is already raised.")
FeedbackEnum.CHEVRON_ALREADY_LOWERED = Feedback.new(-23, FeedbackType.ERROR, "The chevron is already lowered.")

function FeedbackEnum.getName(enum)
    for k,v in pairs(FeedbackEnum) do
        if v == enum then
            return k
        end
    end
    return nil
end
function FeedbackEnum.byCode(code)
    for k,v in pairs(FeedbackEnum) do
        if v.code == code then
            return v
        end
    end
    error("Unknown feedback code")
end
function FeedbackEnum.ofType(type)
    local output = {}
    for k,v in pairs(FeedbackEnum) do
        if v.type == type then
            table.insert(output,v)
        end
    end
    return output
end

return {
    Feedback = Feedback,
    FeedbackType = FeedbackType,
    FeedbackEnum = FeedbackEnum
}
