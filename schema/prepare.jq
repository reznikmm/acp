# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# Adapt the schema to the generator's supported forms. The upstream schema
# remains the authoritative validation contract and is never edited.
. as $root |

def prepare:
  walk(
    if type != "object" then .
    elif (.allOf? | type) == "array" and (.allOf | length) == 1
      and (.allOf[0]["$ref"]? | type) == "string"
    then
      .allOf[0]["$ref"] as $reference |
      if has("properties") or has("type") then
        ($reference | ltrimstr("#/$defs/")) as $name |
        $root["$defs"][$name] as $base |
        if $base.type == null and ($base.anyOf? | type) == "array" then
          # Composition over another union has no single record layout.
          # Keep the whole object opaque, including its discriminator.
          del(.allOf, .properties, .required) + {type: "object"}
        elif $base.type != "object" then
          error("Cannot flatten non-object composition: " + $reference)
        else
          . as $own |
          ($base * ($own | del(.allOf))) |
          .required = (($base.required // []) + ($own.required // []) | unique)
        end
      else
        del(.allOf) + {"$ref": $reference}
      end
    elif (.anyOf? | type) == "array" and (.anyOf | length) > 0
      and all(.anyOf[]; .type? == "string")
      and any(.anyOf[]; (has("const") or has("enum")) | not)
    then
      # An open string union includes arbitrary future values.
      del(.anyOf) + {type: "string"}
    elif (.anyOf? | type) == "array" and (.anyOf | length) == 2
      and ([.anyOf[].type?] | sort) == ["integer", "string"]
    then
      del(.anyOf) + {type: ["integer", "string"]}
    else . end
  );

# Flattened bases can introduce annotation-only allOf wrappers; a second
# pass converts those to direct references as well.
prepare | prepare |

# Updates distinguish omitted fields from explicit null and empty values.
# The generator currently conflates these in typed records. Keep these named
# objects as raw JSON events until presence-aware generated fields exist.
reduce ["ToolCallUpdate", "UserMessage", "AgentMessage", "AgentThought",
        "TerminalUpdate", "SessionInfoUpdate", "UsageUpdate", "CompactionUpdate"][]
  as $name (.; .["$defs"][$name] |= {type: "object", description: .description})
