//
//  AlfredItem.swift
//  AlfredKitPackageDescription
//
//  Created by Satoshi Nagasaka on 2017/10/09.
//

import Foundation

/**
 It is used for Alfred's Script-Filter outputs.

 https://www.alfredapp.com/help/workflows/inputs/script-filter/json/
 */
public struct Item: Encodable {

    // If you want to use Alfred's sort, set same uid throughout subsequent
    let uid: String?

    // displayed in the result row.
    let title: String

    // displayed in the result row.
    let subtitle: String?

    // arg is passed through the workflow to the connected output action.
    let arg: String?

    // displayed in the result row. please set the icon file path from your workflow folder relatively.
    let icon: String?

    // If it is false, Alfred do not action when the user presses return.
    let valid: Bool

    // defines what Alfred matches against when the workflow is set to "Alfred Filters Results"
    let match: String?

    // you can provide which is populated into Alfred's search field.
    let autocomplete: String?

    let type: ItemType

//    let altKeyReact: KeyReact?

//    let commandKeyReact: KeyReact?

    // defines text value which is got by user when copying (⌘C, copy) or displaying large type (⌘L, largetype)
    let text: Text?

    // define url which will be visible if the user tapped shift or ⌘Y (Quick look).
    let quicklookurl: URL?

    public init(
        uid: String? = nil,
        title: String,
        subtitle: String? = nil,
        arg: String? = nil,
        icon: String? = nil,
        valid: Bool = true,
        match: String? = nil,
        autocomplete: String? = nil,
        type: ItemType = .default,
        text: Text? = nil,
        quicklookurl: URL? = nil) {

        self.uid = uid
        self.title = title
        self.subtitle = subtitle
        self.arg = arg
        self.icon = icon
        self.valid = valid
        self.match = match
        self.autocomplete = autocomplete
        self.type = type
        self.text = text
        self.quicklookurl = quicklookurl
    }

    public enum ItemType: String, Encodable {

        case `default` = "default"
        case file = "file"                      // this makes Alfred treat your result as a file on your system.
        case file_skipcheck = "file:skipcheck"  // If you would like Alfred to skip filecheck
    }
}


// control over how the modifier keys react.
public struct KeyReact {

    let valid: Bool
    let arg: String?
    let subTitle: String
    let icon: String?
}

public struct Text: Encodable {

    // ⌘ + C
    let copy: String?
    // ⌘ + L
    let largetype: String?
}
