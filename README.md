# Fluentd sytax for vim

## example

### v0.12
- source

```
# https://github.com/fluent/fluentd/blob/master/example/v0_12_filter.conf

# An example config to use filter plugins.
# THIS FEATURE IS SUPPORTED FOR v0.12 AND ABOVE.

# in_forward to generate events to be tested.
# You can send an arbitrary event with an arbitrary tag.
# For example, the following command creates the event
# {"message":"hello world"} with tag = foo
#
# $ echo '{"message":"hello world"}' | fluent-cat foo

<source>
  @type forward
  port 24224
</source>

# For all events with the tag "foo", filter it out
# UNLESS the value of the "message" field matches /keep this/
#
# - {"message":"keep this please"} is kept.
# - {"message":"Do not keep"} is filtered out.
# - {"messag22":"keep this please"} is filtered out.

<filter foo>
  @type grep
  regexp1  message keep this
</filter>

# Matches the events that was kept by the above filter
<match foo>
  @type stdout
</match>

# For all events with the tag "bar", add the machine's hostname with
# the key "hostname" BEFORE forwarding to another instance of Fluentd
# at 123.4.2.4:24224.

<filter bar>
  @type record_transformer
  <record>
    hostname ${hostname}
  </record>
</filter>
```
- syntax highlighting

<img src="https://raw.githubusercontent.com/wiki/itkq/fluentd-vim/images/ex-v0-12.png" width="60%" />
