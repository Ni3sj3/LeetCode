/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public int val;
 *     public ListNode next;
 *     public ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode DeleteDuplicates(ListNode head) {
        if (head == null)
            return head;
        ListNode loopNode = head; 
        while (loopNode.next != null){
            if(loopNode.val == loopNode.next.val){
                if (loopNode.next.next == null){
                    loopNode.next = null;
                }
                else{
                    loopNode.next = loopNode.next.next;
                }
            }
            else{
                loopNode = loopNode.next;
            }
        }
        return head;
    }
}