----------------------------------------------------------------------
-- Ipe preference settings
----------------------------------------------------------------------
--[[

    This file is part of the extensible drawing editor Ipe.
    Copyright (c) 1993-2019 Otfried Cheong

    Ipe is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    As a special exception, you have permission to link Ipe with the
    CGAL library and distribute executables, as long as you follow the
    requirements of the Gnu General Public License in regard to all of
    the software in the executable aside from CGAL.

    Ipe is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with Ipe; if not, you can find it at
    "http://www.gnu.org/copyleft/gpl.html", or write to the Free
    Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

--]]

local home = os.getenv("HOME")

prefs = {}

-- List of stylesheets that are added to newly created docs.  Without
-- a full path, stylesheets are searched for in the standard style
-- directory.
prefs.styles = { "doctor_xe" }

-- The TeX engine for new documents
-- Possible values are "default", "pdftex", "xetex", and "luatex"
prefs.tex_engine = "xetex"

-- URL for a cloud service that provides Latex compilation
prefs.latex_service_url = "https://latexonline.cc/compile"

-- Interval for autosaving in seconds
-- set to nil to disable autosaving
prefs.autosave_interval = nil -- 10 minutes

-- Filename for autosaving
-- can contain '%s' for the filename of the current file
-- can use 'home' for the user's home directory
-- prefs.autosave_filename = home .. "/autosave.ipe"
if config.platform == "win" then
  prefs.autosave_filename = config.documents .. "\\%s.autosave"
else
  prefs.autosave_filename = home .. "/%s.autosave"
end

-- Should Ipe show the Developer menu
-- (only useful if you develop ipelets or want to customize Ipe)
prefs.developer = false

-- Should Ipe terminate when the last window was closed?
-- (Currently only on OS X)
prefs.terminate_on_close = true

-- Enable continuous spell-checking in text fields by default?
-- (Currently only on OS X)
prefs.spell_check = true

-- External editor for editing text objects
-- must contain '%s' for the temporary filename
-- set this to nil to hide the "Editor" button on text dialogs
if os.getenv("EDITOR") then
  prefs.external_editor = os.getenv("EDITOR") .. " %s"
else
  if config.platform == "win" then
    prefs.external_editor = "notepad.exe %s"
  elseif config.platform == "apple" then
    prefs.external_editor = "open -W -n -e %s"
  else
    -- prefs.external_editor = "xed %s"
    -- prefs.external_editor = "emacsclient %s"
    prefs.external_editor = nil
  end
end

-- The name of the temporary textfile where Ipe will store text to be
-- edited with an external editor.  If set to nil, the Lua function
-- os.tmpname() will be used to create a unique name.
if config.platform == "win" then
  prefs.editable_textfile = config.latexdir .. "/temp.txt"
else
  prefs.editable_textfile = nil
end

if config.platform == "apple" then
  prefs.delete_key = "\8"
else
  prefs.delete_key = "\127"
end

-- Where the tools should be placed (left or right)
-- and which ones should be displayed on start-up
-- tools_placement is only used with Qt toolkit
prefs.tools_placement = {
  properties = "left",
  bookmarks = "right",
  notes = "right",
  layers = "left"
}
prefs.tools_visible = {
  properties = true,
  bookmarks = false,
  notes = false,
  layers = true
}

-- initial ordering of the toolbars (windows only)
prefs.toolbar_order = { "snap", "grid", "angle", "edit", "mode" }

-- Should LaTeX be run automatically every time text has changed?
prefs.auto_run_latex = false

-- Should the external editor be called automatically?
prefs.auto_external_editor = nil

-- Should closing the external editor immediately close the editing dialog?
prefs.editor_closes_dialog = nil

-- If the user interface is too small, scale it here (Windows and Qt only)
-- 100 is the original size, 150 is 50% larger
-- On Windows 10, the system dpi is used automatically if left at 100.
prefs.ui_scale = 100
-- The following influences the size of the toolbar buttons
prefs.toolbar_scale = 100

-- Minimum size of dialog window for creating/editing text objects
prefs.editor_size = { 0, 0 }

-- Width of Notes and Bookmarks tools (Windows only)
prefs.width_notes_bookmarks = 200

-- Size of main window at startup
prefs.window_size = { 1080, 600 }

-- Size of Latex error message window
prefs.latexlog_size = { 800, 600 }

-- Size of page sorter window
prefs.page_sorter_size = { 960, 600 }

-- Width of page thumbnails (height is computed automatically)
prefs.thumbnail_width = 200

-- Canvas customization:
prefs.canvas_style = {
  paper_color = { r = 1.0, g = 1.0, b = 1.0 },  -- white
  -- paper_color = { r = 1.0, g = 1.0, b = 0.5 }  -- classic Ipe 6 yellow
  -- color of the primary selection:
  primary_color = { r = 1.0, g = 0.0, b = 0.0 },
  -- color of the secondary selection:
  secondary_color = { r = 1.0, g = 0.0, b = 1.0 },
  -- classic grid uses dots instead of lines
  classic_grid = false,
  -- line width of grid lines
  -- if classic_grid is true, then thin_grid_lines is size of grid dots
  thin_grid_line = 0.1,
  thick_grid_line = 0.3,
  -- steps indicate multiples of grid distance where grid lines are drawn
  thin_step = 1, thick_step = 4,
  -- e.g. try this: thin_step = 2, thick_step = 5
}


-- Snap modes active when Ipe starts:
prefs.snap = { vertex = false,
	       ctrlpoints = false,
	       boundary = false,
	       intersection = false,
	       grid = true,
	       angle = false,
	       autoangle = false }

-- UI settings when Ipe starts
prefs.initial = {
  grid_size = 16,     -- points
  angle_size = 45,    -- degrees
  grid_visible = true,
}

-- Attributes set when Ipe starts
prefs.initial_attributes = {
  pathmode = "stroked",
  stroke = "black",
  fill = "white",
  pen = "normal",
  dashstyle = "normal",
  farrowshape = "arrow/normal(spx)",
  rarrowshape = "arrow/normal(spx)",
  farrowsize = "normal",
  rarrowsize = "normal",
  farrow = false,
  rarrow = false,
  symbolsize = "normal",
  textsize = "normal",
  textstyle = "normal",
  transformabletext = false,
  horizontalalignment = "left",
  verticalalignment = "baseline",
  pinned = "none",
  transformations = "affine",
  linejoin = "normal",
  linecap = "normal",
  fillrule = "normal",
  markshape = "mark/disk(sx)",
  tiling = "normal",
  gradient = "normal",
  opacity = "opaque",
  strokeopacity = "opaque",
}

-- Resolution settings

-- When you select "normal size" in Ipe, this is the pixels
-- per inch you want to see.
prefs.normal_resolution = 72

-- Maximum distance in pixels selecting/snapping
prefs.select_distance = 36
prefs.snap_distance = 16
-- When transforming objects, if currently select object is further than
-- this distance, the closest object is selected instead
prefs.close_distance = 48

-- Zoom factors, minimal and maximal possible zoom
prefs.zoom_factor = 1.3
prefs.min_zoom = 0.1
prefs.max_zoom = 100

----------------------------------------------------------------------

-- The following settings determine what the scroll wheel on a mouse or a
-- two-finger pan gesture on a touchpad/trackpad  do.

-- There are two sets of settings: "trackpad_scroll" applies to trackpads under OSX,
-- "scroll" applies in all other cases (including external mice in OSX).

-- When pan is true, the gesture moves (pans) the canvas around, and
-- you can control the speed of panning with pixel_per_degree.
-- The direction of the movement is determined by direction.x and direction.y (1 or -1).
-- When pan is false, the vertical scroll movement is used to change the zoom level.
-- You can control the zoom speed using zoom_per_degree.
-- If you want to reverse the direction of zooming, change
-- zoom_per_degree to something smaller than one, e.g. 0.9827

prefs.scroll = { pan = true,
	         pixel_per_degree = 2,
		 zoom_per_degree = 1.0176,
		 direction = { x=1, y=1 } }
prefs.trackpad_scroll = { pan = true,
	              	  pixel_per_degree = 2,
		 	  zoom_per_degree = 1.0176,
			  direction = { x=1, y=1 } }

----------------------------------------------------------------------

-- How close do two vertices need to be to be considered the same
-- in the "Join paths" operation?
prefs.join_threshold = 1e-6

-- If set to true, then whenever the user edits the title of a page,
-- the check box "section: use title" is checked automatically.
prefs.automatic_use_title = false

-- How to start browser to show Ipe manual:
-- (not used with Windows or Cocoa toolkit)

prefs.browser = "xdg-open %s"
-- On Linux, there are some other options you can try if xdg-open
-- doesn't work on your desktop:
-- Gnome 2: gnome-open
-- Gnome 3: gvfs-open
-- KDE: kde-open
-- XFCE: exo-open
-- Ubuntu/Debian: sensible-browser

-- How to start onscreen keyboard
if config.platform == "win" then
  prefs.keyboard = "tabtip.exe"
elseif config.platform == "apple" then
  prefs.keyboard = "open -a KeyboardViewer -n"
else
  -- On Linux, you could use: prefs.keyboard = "onboard &"
  prefs.keyboard = nil
end

-- Disable all snap modes in "ink" drawing mode?
prefs.no_ink_snap = true

----------------------------------------------------------------------
--
-- The following settings can be used to tune the use of the pen in
-- ink mode.  It seems digitizers differ a lot, here you can adapt Ipe
-- to yours.
--
-- If your digitizer generates lots of pen move events, set
-- ink_min_movement to avoid making thousands of tiny ink segments
-- (start with a value like 0.2).
--
-- If there is a lot of noise in pen recognition, try setting
-- ink_smoothing to a positive value k (smoothing is then performed
-- over 2k+1 samples).  Try 3, for instance.
--
-- After a complete ink stroke has been drawn, Ipe simplifies it to
-- remove excess vertices, by computing a path with the minimal number
-- of vertices that differs by at most ink_tolerance.
--
-- Ink strokes that are very short (like a dot on an i) tend to appear
-- too small. Use ink_dot_length and ink_dot_wider to enlarge them.
--
-- Finally, you can set ink_spline to have your ink strokes converted
-- to a spline (rather than a polygonal curve).
--
----------------------------------------------------------------------

-- Minimal distance for movement to update ink stroke
prefs.ink_min_movement = 0

-- To smooth ink strokes, perform sliding average over how many samples?
prefs.ink_smoothing = 0

-- When ink stroke is simplified, what is the tolerance?
prefs.ink_tolerance = 0.3

-- Threshold for considering an ink stroke a tap with little movement:
prefs.ink_dot_length = 10.0

-- When user taps the screen in ink mode with no or little movement,
-- how much should the pen width be enlarged?
-- nil means use current pen width
prefs.ink_dot_wider = 2.0

-- Turn ink strokes into splines?
prefs.ink_spline = false

----------------------------------------------------------------------

-- Auto-exporting when document is being saved
-- If this is set, then every time you save in xml format, say to
-- mydoc.ipe, the same document is EXPORTED to mydoc.pdf.
-- Careful: if mydoc.pdf exists, it is silently overwritten.
-- mydoc.pdf cannot be opened by Ipe (it is an exported copy).

prefs.auto_export_to_pdf = false

----------------------------------------------------------------------

-- Extended properties menu, perhaps useful for tablets:
prefs.tablet_menu = false

-- format string for the coordinates in the status bar
-- (x, unit, y, unit)
-- prefs.coordinates_format = "%g%s, %g%s"
prefs.coordinates_format = "(%7.3f%s, %7.3f%s)"

-- possible scale factors for coordinates output
-- must be integers. -5 means "5:1", +5 means "1:5"
prefs.scale_factors = { -100, -5, 10, 100, 1000, 10000 }

-- Default directory for "Save as" dialog, when
-- the current document does not have a filename
-- (or the filename is not absolute)
if config.platform == "win" then
  -- Another reasonable setting: config.desktop
  prefs.save_as_directory = config.documents
else
  -- If you use Ipe from the commandline, "." is the right value.
  -- Otherwise, you could use the home directory
  prefs.save_as_directory = "."
  -- prefs.save_as_directory = home
end

-- Pattern for lists of filenames
-- The separator is a semicolon on Windows, a colon otherwise
if config.platform == "win" then
  prefs.fsep = "\\"
  prefs.fname_pattern = "[^;]+"
  prefs.dir_pattern = "^(.+)\\[^\\]+"
  prefs.basename_pattern = "\\([^\\]+)$"
else
  prefs.fsep = "/"
  prefs.fname_pattern = "[^:]+"
  prefs.dir_pattern = "^(.+)/[^/]+"
  prefs.basename_pattern = "/([^/]+)$"
end

----------------------------------------------------------------------