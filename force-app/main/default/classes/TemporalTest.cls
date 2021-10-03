@isTest
private class TemporalTest {

    @isTest
    static void myUnitTest() {
        Temporal demo = new Temporal();
        System.assertEquals(demo.getAppVersion(), '1.0.0');
    }
}
