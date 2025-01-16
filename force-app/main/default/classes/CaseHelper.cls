public with sharing class CaseHelper {
    public CaseHelper() {

    }

    public static void SetStatusNew(List<Case> caseList) {
        for(Case c : caseList) {
            c.Status = 'New';
        }
    }

    public static void SetStatusWorking(List<Case> oldCase, List<Case> newCase) {

        for(Integer i = 0; i < newCase.size(); i++) {
            if(!oldCase.get(i).Comments.equals(newCase.get(i).Comments) && oldCase.get(i).Status.equals('New')) {
                newCase.get(i).Status = 'Working';
            }
        }
    }
}