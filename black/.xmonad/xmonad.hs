import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.SpawnOn
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import System.IO

layout' = avoidStruts (spacing 10 $ noBorders (tiled ||| Full))
    where
        tiled   = ResizableTall nmaster delta ratio []
        nmaster = 1
        delta   = 1/100
        ratio   = 1/2

keys' conf@(XConfig {XMonad.modMask = modm}) = M.fromList
            [ ((modm, xK_a), sendMessage MirrorShrink)
            , ((modm, xK_z), sendMessage MirrorExpand) 
            ]

spawnToWorkspace :: String -> String -> X ()
spawnToWorkspace program workspace = do
                                      spawn program     
                                      windows $ W.greedyView workspace
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { terminal = "urxvt"
        , startupHook = do
            spawnToWorkspace "spotify" "music"
        , focusedBorderColor = "#4DBCE9"
        , workspaces = ["1", "2", "3", "4", "5", "web", "chat", "mail", "music"]
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = layout'
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "green" . shorten 50
                        , ppOrder = \(ws:_:t:_) -> ["", ws, "  -  <fc=#4DBCE9>Thanks for flying VIM!</fc>"]
                        , ppSep = ""
                        , ppCurrent = xmobarColor "#4DBCE9" "" . wrap "[" "]"
                        }
        , keys = keys' <+> keys defaultConfig 
    }
