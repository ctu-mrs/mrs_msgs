builtin_interfaces/Time stamp

uint8 type

uint8 TYPE_GENERAL = 0           # a problem of the node itself, described in description
uint8 TYPE_WAITING_FOR_TOPIC = 1 # waiting for waited_for_topic, expected from expected_publisher
uint8 TYPE_WAITING_FOR_NODE = 2  # waiting for waited_for_node

string description                           # TYPE_GENERAL: human-readable description
string waited_for_topic                      # TYPE_WAITING_FOR_TOPIC: the topic
mrs_msgs/ErrorgraphNodeID waited_for_node    # TYPE_WAITING_FOR_NODE: the node
mrs_msgs/ErrorgraphNodeID expected_publisher # TYPE_WAITING_FOR_TOPIC: the node expected to publish the topic, empty if unknown
