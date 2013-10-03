/*  This file is part of corebird, a Gtk+ linux Twitter client.
 *  Copyright (C) 2013 Timm Bäder
 *
 *  corebird is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  corebird is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with corebird.  If not, see <http://www.gnu.org/licenses/>.
 */


using Gtk;


[GtkTemplate (ui = "/org/baedert/corebird/ui/dm-thread-entry.ui")]
class DMThreadEntry : Gtk.ListBoxRow {
  public static bool equal_func (DMThreadEntry a, DMThreadEntry b) {
    return a.user_id == b.user_id;
  }
  [GtkChild]
  private Label name_label;
  [GtkChild]
  private Label screen_name_label;
  [GtkChild]
  private Label last_message_label;
  [GtkChild]
  private Image avatar_image;
  public int64 user_id {public get; private set;}
  public new string name {
    get {
      return name_label.label;
    }
    set {
      name_label.label = value;
    }
  }
  public string screen_name {
    get{
      return screen_name_label.label;
    }
    set {
      screen_name_label.label = "@" + value;
    }
  }
  public string last_message {
    get {
      return last_message_label.label;
    }
    set {
      last_message_label.label = value;
    }
  }
  public int64 last_message_id {get; set;}
  public Gdk.Pixbuf avatar {
    set { avatar_image.pixbuf = value;}
  }



  public DMThreadEntry (int64 user_id) {
    this.user_id = user_id;
  }
}

