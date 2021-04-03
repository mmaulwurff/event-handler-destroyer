version 4.5

class ehd_Destroyer : Actor
{

  override void beginPlay()
  {
    tryToDestroyEventHandler();
    destroy();
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private void tryToDestroyEventHandler() const
  {
    string toDestroyString = Cvar.getCvar("ehd_event_handler_name").getString();
    if (toDestroyString.length() == 0)
    {
      Console.printf("Usage: ehd_destroy <event handler name>");
      return;
    }

    class<StaticEventHandler> toDestroyClass = toDestroyString;
    if (toDestroyClass == NULL)
    {
      Console.printf("%s is not an event handler.", toDestroyString);
      return;
    }

    let toDestroyObject = (toDestroyClass is "EventHandler")
      ? EventHandler.find(toDestroyClass)
      : StaticEventHandler.find(toDestroyClass);

    if (toDestroyObject == NULL)
    {
      Console.printf("%s not found.", toDestroyString);
      return;
    }

    toDestroyObject.destroy();
  }

} // class ehd_Destroyer

class ehd_Lister : Actor
{

  override void beginPlay()
  {
    listEventHandlers();
    destroy();
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private static void listEventHandlers()
  {
    Array<string> eventHandlers;

    uint nClasses = AllClasses.size();
    for (uint i = 0; i < nClasses; ++i)
    {
      class aClass = AllClasses[i];

      if (  aClass is "StaticEventHandler"
         && aClass != "StaticEventHandler"
         && aClass != "EventHandler"
         )
      {
        eventHandlers.push(aClass.getClassName());
      }
    }

    Console.printf("Event handlers: %s", join(eventHandlers, ", "));
  }

  private static clearscope string join(Array<string> strings, string delimiter)
  {
    string result;

    uint nStrings = strings.size();
    for (uint i = 0; i < nStrings; ++i)
    {
      if (strings[i].length() == 0) continue;

      if (result.length() == 0)
      {
        result = strings[i];
      }
      else
      {
        result.appendFormat("%s%s", delimiter, strings[i]);
      }
    }

    return result;
  }

} // class ehd_Lister
