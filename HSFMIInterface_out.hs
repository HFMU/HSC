{-# LINE 1 "HSFMIInterface.hs" #-}
{-# LINE 1 "HSFMIInterface.hsc" #-}
module HSFMIInterface.hsc where



type CompEnvT = Ptr ()
type FMIStatus = CInt

{-# LINE 9 "HSFMIInterface.hsc" #-}
data Status = OK | Warning | Discard | Error | Fatal | Pending deriving (Enum, Show)
type CallbackLogger = FunPtr(CompEnvT -> CString -> FMIStatus -> CString -> CString -> IO ())
type StepFinished = FunPtr(CompEnvT -> FMIStatus -> IO ())
data CallbackFunctions = CallbackFunctions {
  logger :: CallbackLogger,
  allocMem :: Ptr(),
  freeMem :: Ptr (), -- Ignoring
  stepFinished :: StepFinished, -- Ignoring
  compEnv :: CompEnvT
  }

instance Storable CallbackFunctions where
  sizeOf _ = ((40))
{-# LINE 22 "HSFMIInterface.hsc" #-}
  alignment _ = (8)
{-# LINE 23 "HSFMIInterface.hsc" #-}
  peek p = return CallbackFunctions
    `ap` ((\hsc_ptr -> peekByteOff hsc_ptr 0) p)
{-# LINE 25 "HSFMIInterface.hsc" #-}
    `ap` nullPtr
    `ap` nullPtr
    `ap` ((\hsc_ptr -> peekByteOff hsc_ptr 24) p)
{-# LINE 28 "HSFMIInterface.hsc" #-}
    `ap`  ((\hsc_ptr -> peekByteOff hsc_ptr 32) p)
{-# LINE 29 "HSFMIInterface.hsc" #-}

