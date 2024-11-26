package br.com.estok.util;

import com.google.gson.*;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

// https://stackoverflow.com/questions/72769462/failed-making-field-property-accessible-either-change-its-visibility-or-write

public class LocalDateAdapter implements JsonSerializer<LocalDate>, JsonDeserializer<LocalDate> {

    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Override
    public JsonElement serialize(LocalDate localDate, Type typeOfSrc, JsonSerializationContext context) {
        return new JsonPrimitive(localDate.format(formatter));
    }

    @Override
    public LocalDate deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
        return LocalDate.parse(json.getAsString(), formatter);
    }
}
