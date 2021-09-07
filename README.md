# sway-focus.kak

Implement window focusing for sway.

NOTE: I don't think this is robust, because it relies on the way kakoune names the terminal window it is running into,
i.e. the script asks sway to focus the window whose title ends with this string: "$kak_client@[$kak_session] - Kakoune"

But for now it works ok.
