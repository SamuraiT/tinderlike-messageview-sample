//
//  MessageViewController.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/06.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIKit

class MessageViewController: JSQMessagesViewController{
    
    var msg:JSQMessage!
    var messages = [JSQMessage]()
    // this view's user setting
    var outgoingBubble : JSQMessagesBubbleImage?
    var outgoingAvator : JSQMessagesAvatarImage?
    // other view's user setting
    var incomingAvator : JSQMessagesAvatarImage?
    var incomingBubble : JSQMessagesBubbleImage?
    var _senderId : String?
    var _senderDisplayName : String?
    
    @IBAction func chatTapped(sender: AnyObject) {
        UIStoryboard.presentMatchingPeopleListViewController(self)
    }
    
    @IBAction func menuTapped(sender: AnyObject) {
        if isUserInvestor == true{
            UIStoryboard.presentFounderTinderView(self)
        } else {
            UIStoryboard.presentInvestorTinderView(self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self._senderId = "12345"
        self._senderDisplayName = "samurait"
        let bubleFactory = JSQMessagesBubbleImageFactory()
        // set user's info: image, message color
        self.outgoingBubble =
            JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
        self.outgoingAvator =
            JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "person_placeholder.png"), diameter: 64)
        
        // set other user's info
        self.incomingBubble =
            JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleGreenColor())
        self.incomingAvator =
            JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "person_placeholder.png"), diameter: 64)
        
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as JSQMessagesCollectionViewCell
        cell.textView.text = self.messages[indexPath.row].text!
        return cell
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        self.msg = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: NSDate(), text: text)
        messages.append(self.msg)
        self.finishSendingMessageAnimated(true)
        receiveAutoMessage()
    }
    
    func didFinishMessageTimer(timer: NSTimer){
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        //TODO instead of creating mesage, request server if there are new messages.
        //If so, get the new message, apend it and show
        let message = JSQMessage(senderId: "124", displayName: "tatsuro", text: "Hi, nice to meet you! You wanna invest on us? wow it sounds great! \r but Did you know there are better guys who you should invest. They are Hiro and Tatsuro")
        self.messages.append(message)
        self.finishReceivingMessageAnimated(true)
    }
    
    func receiveAutoMessage(){
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "didFinishMessageTimer:", userInfo: nil, repeats: false)
    }
    
}

extension MessageViewController: JSQMessagesCollectionViewDataSource {
    
    func senderDisplayName() -> String! {
        return self._senderDisplayName
    }
    
    func senderId() -> String! {
        return self._senderId
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        
        return self.messages[indexPath.row]
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = self.messages[indexPath.row]
        if (message.senderId == self.senderId) {
            return self.outgoingBubble;
        }
        return self.incomingBubble;
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        let message = self.messages[indexPath.row]
        if (message.senderId == self.senderId) {
            return nil
            //self.outgoingAvator;
        }
        return nil //self.incomingAvator;
    }
    
    
}

extension MessageViewController: JSQMessagesCollectionViewDelegateFlowLayout{
    
}