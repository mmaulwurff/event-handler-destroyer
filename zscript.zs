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
