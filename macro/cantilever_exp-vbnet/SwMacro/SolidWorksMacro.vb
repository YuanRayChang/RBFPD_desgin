Imports SolidWorks.Interop.sldworks
Imports SolidWorks.Interop.swconst
Imports System

Partial Class SolidWorksMacro

    Public Sub main()


            
            '
            'Open
            Dim swDoc As ModelDoc2 = Nothing
            swDoc = CType(swApp.OpenDoc6("E:\cantilever_YZ\raw.SLDPRT", 1, 0, "", longstatus, longwarnings),ModelDoc2)
            swApp.ActivateDoc2("raw.SLDPRT", false, longstatus)
            swDoc = CType(swApp.ActiveDoc,ModelDoc2)
            swDoc = CType(swApp.ActiveDoc,ModelDoc2)
            Dim myModelView As ModelView = Nothing
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.FrameLeft = 0
            myModelView.FrameTop = 0
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.FrameState = CType(swWindowState_e.swWindowMaximized,Integer)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.FrameState = CType(swWindowState_e.swWindowMaximized,Integer)
            swDoc.SketchManager.InsertSketch(true)
            boolstatus = swDoc.Extension.SelectByID2("Plane3", "PLANE", 0.084971974741804152, -0.058424665656981865, 0.046445332048111063, false, 0, Nothing, 0)
            swDoc.ClearSelection2(true)
            '
            Dim pointArray As Array = Nothing
            Dim points(47) As Double
            points(0) = 0.049945563390025427
            points(1) = 0.028751727304475949
            points(2) = 0
            points(3) = 0.050822016476729459
            points(4) = 0.0303098024591808
            points(5) = 0
            points(6) = 0.051237707026984936
            points(7) = 0.031748025678906444
            points(8) = 0
            points(9) = 0.050935993199203722
            points(10) = 0.033425952768586953
            points(11) = 0
            points(12) = 0.049945563390025427
            points(13) = 0.034564546150871678
            points(14) = 0
            points(15) = 0.047806009265144667
            points(16) = 0.0345046201833803
            points(17) = 0
            points(18) = 0.04643023967153681
            points(19) = 0.034564546150871678
            points(20) = 0
            points(21) = 0.044529081508557056
            points(22) = 0.034564546150871678
            points(23) = 0
            points(24) = 0.043214213367548382
            points(25) = 0.034324842280916812
            points(26) = 0
            points(27) = 0.042478186087834047
            points(28) = 0.0333660268011009
            points(29) = 0
            points(30) = 0.042118741264744131
            points(31) = 0.031328543906486317
            points(32) = 0
            points(33) = 0.043141584050857773
            points(34) = 0.029650616816807585
            points(35) = 0
            points(36) = 0.044825585487814124
            points(37) = 0.028332245532055822
            points(38) = 0
            points(39) = 0.046416649517283304
            points(40) = 0.029470838914338771
            points(41) = 0
            points(42) = 0.047389764591827088
            points(43) = 0.028751727304475949
            points(44) = 0
            points(45) = 0.049945563390025427
            points(46) = 0.028751727304475949
            points(47) = 0
            pointArray = points
            Dim skSegment As SketchSegment = Nothing
            skSegment = CType(swDoc.SketchManager.CreateSpline(pointArray),SketchSegment)
            swDoc.ClearSelection2(true)
            swDoc.SketchManager.InsertSketch(true)
            Dim myFeature As Feature = Nothing
            myFeature = CType(swDoc.FeatureManager.FeatureExtrusion2(true, false, true, 0, 0, 0.0019, 0.01, false, false, false, false, 0.017453292519943334, 0.017453292519943334, false, false, false, false, false, true, true, 0, 0, false),Feature)
            swDoc.ISelectionManager.EnableContourSelection = false
            boolstatus = swDoc.Extension.SelectByID2("Plane3", "PLANE", 0.11922874712498066, -0.058424665656982108, 0.045007984955110644, false, 0, Nothing, 0)
            swDoc.BlankRefGeom()
            boolstatus = swDoc.Extension.SelectByID2("Imported1", "BODYFEATURE", 0, 0, 0, false, 0, Nothing, 0)
            swDoc.FeatureManager.HideBodies()
            boolstatus = swDoc.Extension.SelectByID2("Imported1", "BODYFEATURE", 0, 0, 0, false, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Imported1", "BODYFEATURE", 0, 0, 0, false, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByRay(0.089703242256263568, -0.099567028682997716, 0.023088441786854642, 0, 1, 0, 0.00020362417150839173, 2, false, 0, 0)
            boolstatus = swDoc.Extension.SelectByRay(0.0901823579539304, -0.094260359070915456, 0.030993850798356877, 0, 1, 0, 0.00020362417150839173, 2, false, 0, 0)
            swDoc.FeatureManager.HideBodies()
            swDoc.ClearSelection2(true)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.039130157606990394)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.062608252171184639)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.10173840977817503)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.10173840977817503)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.070434283692582714)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.039130157606990394)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.039130157606990394)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(-0.0034468884913994679, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.046956189128388469)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.046956189128388469)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.039130157606990394)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0068937769827989359, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.046956189128388469)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0068937769827989359, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.023478094564194234)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0068937769827989359, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0068937769827989359, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0.0034468884913994679, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.03130412608559232)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.01565206304279616)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            myModelView = CType(swDoc.ActiveView,ModelView)
            myModelView.RotateAboutCenter(0, 0.00782603152139808)
            '
            'Roll View
            Dim swModelView As ModelView = Nothing
            swModelView = CType(swDoc.ActiveView,ModelView)
            swModelView.RollBy(0)
            boolstatus = swDoc.Extension.SelectByRay(0.0919536572454831, -0.094161730264943344, 0.0366264598772581, 0.95866343142210164, -0.28052908044226049, -0.047622056656779314, 0.00020362417150839173, 2, true, 1, 0)
            Dim currHiddenEdgeSelectionInHLR As Integer
            currHiddenEdgeSelectionInHLR = swApp.GetUserPreferenceToggle(CType(swUserPreferenceToggle_e.swEdgesHiddenEdgeSelectionInHLR,Integer))
            swApp.SetUserPreferenceToggle(CType(swUserPreferenceToggle_e.swEdgesHiddenEdgeSelectionInHLR,Integer), true)
            swDoc.ClearSelection2(true)
            boolstatus = swDoc.Extension.SelectByRay(0.0919536572454831, -0.094161730264943344, 0.0366264598772581, 0.95866343142210164, -0.28052908044226049, -0.047622056656779314, 0.00020362417150839173, 2, false, 1, 0)
            swApp.SetUserPreferenceToggle(CType(swUserPreferenceToggle_e.swEdgesHiddenEdgeSelectionInHLR,Integer), currHiddenEdgeSelectionInHLR)
            Dim radiiArray1 As Array = Nothing
            Dim radiis1(-1) As Double
            Dim dist2Array1 As Array = Nothing
            Dim dists21(-1) As Double
            Dim conicRhosArray1 As Array = Nothing
            Dim coniRhos1(-1) As Double
            Dim setBackArray1 As Array = Nothing
            Dim setBacks1(-1) As Double
            Dim pointArray1 As Array = Nothing
            Dim points1(-1) As Double
            Dim pointDist2Array1 As Array = Nothing
            Dim pointsDist21(-1) As Double
            Dim pointRhoArray1 As Array = Nothing
            Dim pointsRhos1(-1) As Double
            radiiArray1 = radiis1
            dist2Array1 = dists21
            conicRhosArray1 = coniRhos1
            setBackArray1 = setBacks1
            pointArray1 = points1
            pointDist2Array1 = pointsDist21
            pointRhoArray1 = pointsRhos1
            myFeature = CType(swDoc.FeatureManager.FeatureFillet3(195, 0.0004, 0, 0, 0, 0, 0, radiiArray1, dist2Array1, conicRhosArray1, setBackArray1, pointArray1, pointDist2Array1, pointRhoArray1),Feature)
            boolstatus = swDoc.Extension.SelectByID2("Imported3", "SOLIDBODY", 0, 0, 0, true, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Fillet1", "SOLIDBODY", 0, 0, 0, true, 0, Nothing, 0)
            swDoc.ClearSelection2(true)
            boolstatus = swDoc.Extension.SelectByID2("Fillet1", "BODYFEATURE", 0, 0, 0, false, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Imported3", "SOLIDBODY", 0, 0, 0, true, 1, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Fillet1", "SOLIDBODY", 0, 0, 0, true, 2, Nothing, 0)
            myFeature = CType(swDoc.FeatureManager.InsertCombineFeature(15902, Nothing, Nothing),Feature)
            swDoc.ClearSelection2(true)
            boolstatus = swDoc.Extension.SelectByID2("Combine1", "SOLIDBODY", 0, 0, 0, true, 0, Nothing, 0)
            '
            swDoc.ClearSelection2(true)
            boolstatus = swDoc.Extension.SelectByID2("Combine1", "SOLIDBODY", 0, 0, 0, false, 1, Nothing, 0)
            '
            myFeature = CType(swDoc.FeatureManager.InsertMoveCopyBody2(0, 0, 0, 0, 0.094431183755000023, -0.092067028683000013, 0.025070394354944445, 0, 0, 0, true, 1),Feature)
            boolstatus = swDoc.Extension.SelectByID2("Imported1", "SOLIDBODY", 0, 0, 0, true, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Body-Move/Copy1", "SOLIDBODY", 0, 0, 0, true, 0, Nothing, 0)
            swDoc.ClearSelection2(true)
            boolstatus = swDoc.Extension.SelectByID2("Body-Move/Copy1", "BODYFEATURE", 0, 0, 0, false, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Imported1", "SOLIDBODY", 0, 0, 0, true, 1, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Body-Move/Copy1", "SOLIDBODY", 0, 0, 0, true, 2, Nothing, 0)
            myFeature = CType(swDoc.FeatureManager.InsertCombineFeature(15902, Nothing, Nothing),Feature)
            boolstatus = swDoc.Extension.SelectByID2("Imported2", "SOLIDBODY", 0, 0, 0, true, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Combine2", "SOLIDBODY", 0, 0, 0, true, 0, Nothing, 0)
            swDoc.ClearSelection2(true)
            boolstatus = swDoc.Extension.SelectByID2("Combine2", "BODYFEATURE", 0, 0, 0, false, 0, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Imported2", "SOLIDBODY", 0, 0, 0, true, 2, Nothing, 0)
            boolstatus = swDoc.Extension.SelectByID2("Combine2", "SOLIDBODY", 0, 0, 0, true, 2, Nothing, 0)
            myFeature = CType(swDoc.FeatureManager.InsertCombineFeature(15903, Nothing, Nothing),Feature)
            '
            'Save As
            longstatus = swDoc.SaveAs3("E:\cantilever_YZ\step\0_0.STEP", 0, 0)
    End Sub

    ''' <summary>
    ''' The SldWorks swApp variable is pre-assigned for you.
    ''' </summary>
    Public swApp As SldWorks


End Class
