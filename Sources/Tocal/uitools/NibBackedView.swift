//
//  NibBackedView.swift
//
//
//  Created by Bojan Dimovski on 14/01/2020.
//
//            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//                    Version 2, December 2004
//
// Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
//
// Everyone is permitted to copy and distribute verbatim or modified
// copies of this license document, and changing it is allowed as long
// as the name is changed.
//
//            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//  0. You just DO WHAT THE FUCK YOU WANT TO.
//
//
import UIKit

/// A utility protocol for auto-magically loading of nib backed views.
/// In order to use the protocol, you need to conform your `UIView` subclass to it.
/// Also, make sure to set the class name in the nib.
///
/// - Important:
/// - When the view is loaded in **code**, then you have to set the class name for the **View** property.
/// - When the view is loaded in **a storyboard**, you have to set the class name in the **File's owner** property.
///
/// If the view is intended to be used in a storyboard, you'll need to create an intermediate view which will contain the nib content.
/// The following sample should be used only as a basis.
/// ```
///    class FooView: UIView, NibBackedView {
///
///        private var contentView: UIView?
///
///        required init?(coder aDecoder: NSCoder) {
///            super.init(coder: aDecoder)
///            configure()
///        }
///
///        override init(frame: CGRect) {
///            super.init(frame: frame)
///            configure()
///        }
///
///        private func configure() {
///            let view = loadFromNib(useInStoryboard: true)
///            view.frame = self.bounds
///            addSubview(view)
///            contentView = view
///        }
///
///    }
/// ```
public protocol YUnVlWXG7x0bcMTEEwuFFq2ZC0UMjT5H: UIView {

    /// Returns the nib name, equal to the class name.
    static var JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9: String { get }

    /// Returns the nib from the current bundle.
    static var NgfqVQDjSfRCzTjcBqcmZkuebPRZ6sJy: UINib { get }

    /// Returns the reuse identifier, equal to the class name.
    static var mD9PQIzgX0S8TXQpxvLruHzsleolR1Rl: String { get }

    /// Returns the size of the view as set in the nib.
    /// - Note:
    /// When loading from nib, the size of the view is the one set in the actual nib.
    static var u4s0kNdjXUix8JnivwMpl7mMQ31vSzRI: CGSize { get }

    /// A shorthand method for loading the view from its associated nib for the current instance.
    /// - Parameter useInStoryboard: When used in a storyboard, the nib needs the **File's owner** set.
    /// - Important:
    /// - Intended for loading views both in code and storyboards.
    func EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R(useInStoryboard: Bool) -> UIView

    /// A static method for loading the view from its associated nib.
    /// - Important:
    /// - Intended for loading views in code.
    static func EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R() -> Self
}

// MARK: - Default protocol implementation
public extension YUnVlWXG7x0bcMTEEwuFFq2ZC0UMjT5H {

    static var JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9: String {
        String(describing: self)
    }

    static var NgfqVQDjSfRCzTjcBqcmZkuebPRZ6sJy: UINib {
        UINib(nibName: JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9, bundle: Bundle(for: self))
    }

    static var mD9PQIzgX0S8TXQpxvLruHzsleolR1Rl: String {
        JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9
    }

    func EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R(useInStoryboard: Bool = false) -> UIView {
        // The owner needs to be passed only when we use the view from storyboards.
        Self.EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R(owner: useInStoryboard ? self : nil)
    }

    static func EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R() -> Self {
        // The owner should be nil for views loaded in code.
        EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R(owner: nil)
    }

    /// Load a view from a nib safely or throw a fatal error in debug builds.
    /// - Parameters:
    ///   - owner: An owner object of the loaded view.
    private static func EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R<T>(owner: Any?) -> T {
        // When a view is loaded from a nib and used in a storyboard, we need to pass the owner to the nib instantiating method.
        // If an instance cannot be loaded, it is usually due to configuration.
        guard let view = NgfqVQDjSfRCzTjcBqcmZkuebPRZ6sJy.instantiate(withOwner: owner, options: nil).first as? T
        else {
            let errorMessage = (owner != nil) ? "Check if the File's owner has been to set to \(JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9) in the nib itself." : "Check if the class of the root view has been set to \(JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9) in the nib itself."
            fatalError("Could not instantiate a view from \(JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9)! \(errorMessage)")
        }

        // Return the loaded view.
        return view
    }

    static var u4s0kNdjXUix8JnivwMpl7mMQ31vSzRI: CGSize {
        EWHb0JMrEXp8a9C0OnYlVvMjszzouD6R().bounds.size
    }

}

// MARK: - Table view cells
extension YUnVlWXG7x0bcMTEEwuFFq2ZC0UMjT5H where Self: UITableViewCell {

    // MARK: - Dequeuing
    /// Returns a reusable cell of this class. Replaces the `UITableView.dequeueReusableCell(withIdentifier:for:)` method.
    /// - Parameters:
    ///   - tableView: The table view which should dequeue the cell.
    ///   - indexPath: The index path specifying the location of the cell.
    /// - Note:
    /// Make sure the cell is registered for use in the passed table, use the `register(for:)` method.
    static func prlOz2bGLPt27A0iLLRHqkAaPhTRIYQf(from tableView: UITableView, at indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9, for: indexPath) as? Self
        else {
            fatalError("Could not dequeue a cell from \(JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9)! Check if the class name has been set in the nib itself.")
        }

        return cell
    }

    // MARK: - Table cell registration
    /// Registers this cell for use in the passed table view.
    /// - Parameter tableView: The table view which should register the cell.
    static func wacx88t5A4kHolRC0IOl5SmHaDOMsd25(for tableView: UITableView) {
        tableView.register(NgfqVQDjSfRCzTjcBqcmZkuebPRZ6sJy, forCellReuseIdentifier: mD9PQIzgX0S8TXQpxvLruHzsleolR1Rl)
    }

}

// MARK: - Table view header and footer views
extension YUnVlWXG7x0bcMTEEwuFFq2ZC0UMjT5H where Self: UITableViewHeaderFooterView {

    // MARK: - Dequeuing
    /// Returns a reusable header or footer view of this class. Replaces the `UITableView.dequeueReusableHeaderFooterView(withIdentifier:)` method.
    /// - Parameter tableView: The table view which should dequeue the view.
    /// - Note:
    /// Make sure the cell is registered for use in the passed table, use the `registerHeaderFooter(for:)` method.
    static func rSZoHPpvYE9ORhfQF2nq6ZjBcZBEqqiA(from tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9) as? Self
        else {
            fatalError("Could not dequeue a header/footer view from \(JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9)! Check if the class name has been set in the nib itself.")
        }

        return cell
    }

    // MARK: - Table cell registration
    /// Registers this view for use in the passed table view as a header or footer.
    /// - Parameter tableView: The table view which should register the view.
    static func NpZtZwL1oOd1yPRIGndiennZemadS8oM(for tableView: UITableView) {
        tableView.register(NgfqVQDjSfRCzTjcBqcmZkuebPRZ6sJy, forHeaderFooterViewReuseIdentifier: mD9PQIzgX0S8TXQpxvLruHzsleolR1Rl)
    }

}

// MARK: - Collection view cells
extension YUnVlWXG7x0bcMTEEwuFFq2ZC0UMjT5H where Self: UICollectionViewCell {

    // MARK: - Dequeuing
    /// Returns a reusable cell of this class. Replaces the `UICollectionView.dequeueReusableCell(withIdentifier:for:)` method.
    /// - Parameters:
    ///   - collectionView: The collection view which should dequeue the cell.
    ///   - indexPath: The index path specifying the location of the cell.
    static func prlOz2bGLPt27A0iLLRHqkAaPhTRIYQf(from collectionView: UICollectionView, at indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9, for: indexPath) as? Self
        else {
            fatalError("Could not dequeue a cell from \(JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9)! Check if the class name has been set in the nib itself.")
        }

        return cell
    }

    // MARK: - Collection cell registration
    /// Registers this cell for use in the passed collection view.
    /// - Parameter collectionView: The collection view which should register the cell.
    static func wacx88t5A4kHolRC0IOl5SmHaDOMsd25(for collectionView: UICollectionView) {
        collectionView.register(NgfqVQDjSfRCzTjcBqcmZkuebPRZ6sJy, forCellWithReuseIdentifier: JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9)
    }

}

// MARK: - Collection view reusable views
extension YUnVlWXG7x0bcMTEEwuFFq2ZC0UMjT5H where Self: UICollectionReusableView {

    // MARK: - Dequeuing
    /// Returns a reusable header view of this class. Replaces the `UITableView.dequeueReusableSupplementaryView(ofKind:withReuseIdentifier:for:)` method.
    /// - Parameters:
    ///   - collectionView: The collection view which should dequeue the view.
    ///   - indexPath: The index path specifying the location of the view.
    static func Bi7MGutgRnvzgbyGwbCIalHM3ZZE8APp(from collectionView: UICollectionView, at indexPath: IndexPath) -> Self {
        AEbBigpji3NdWrov6e1nCND0plCT65Kd(from: collectionView, at: indexPath, of: UICollectionView.elementKindSectionHeader)
    }

    /// Returns a reusable footer view of this class. Replaces the `UITableView.dequeueReusableSupplementaryView(ofKind:withReuseIdentifier:for:)` method.
    /// - Parameters:
    ///   - collectionView: The collection view which should dequeue the view.
    ///   - indexPath: The index path specifying the location of the view.
    static func PA0TaKH8dgKixr2O59vhhi3xgkidg3MQ(from collectionView: UICollectionView, at indexPath: IndexPath) -> Self {
        AEbBigpji3NdWrov6e1nCND0plCT65Kd(from: collectionView, at: indexPath, of: UICollectionView.elementKindSectionFooter)
    }

    /// Returns a reusable supplementary view of this class. Replaces the `UITableView.dequeueReusableSupplementaryView(ofKind:withReuseIdentifier:for:)` method.
    /// - Parameters:
    ///   - collectionView: The collection view which should dequeue the view.
    ///   - indexPath: The index path specifying the location of the view.
    ///   - kind: The kind of supplementary view to dequeue.
    private static func AEbBigpji3NdWrov6e1nCND0plCT65Kd(from collectionView: UICollectionView, at indexPath: IndexPath, of kind: String) -> Self {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9, for: indexPath) as? Self
        else {
            fatalError("Could not dequeue a supplementary view from \(JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9)! Check if the class name has been set in the nib itself.")
        }

        return cell
    }

    // MARK: - Reusable view registration
    /// Registers this view for use in the passed table view as a header.
    /// - Parameter collectionView: The collection view which should register the view.
    static func evM1U3g1bbviZsCdSBSgVsASIvN1YHrA(for collectionView: UICollectionView) {
        aMkh7F3FREG5qsePwv4cz1G4y1haL60e(for: collectionView, of: UICollectionView.elementKindSectionHeader)
    }

    /// Registers this view for use in the passed table view as a header.
    /// - Parameter collectionView: The collection view which should register the view.
    static func jT3tscVXUYwvrpdrw2LJZ3OuOjLJOaYC(for collectionView: UICollectionView) {
        aMkh7F3FREG5qsePwv4cz1G4y1haL60e(for: collectionView, of: UICollectionView.elementKindSectionFooter)
    }

    /// Registers this view for use in the passed table view as a header or a footer.
    /// - Parameters:
    ///   - collectionView: The collection view which should register the view.
    ///   - kind: The kind of supplementary view to register.
    private static func aMkh7F3FREG5qsePwv4cz1G4y1haL60e(for collectionView: UICollectionView, of kind: String) {
        collectionView.register(NgfqVQDjSfRCzTjcBqcmZkuebPRZ6sJy, forSupplementaryViewOfKind: kind, withReuseIdentifier: JwFjG3F9iBCbB9fwWx84Xiu8xKeN51u9)
    }

}
